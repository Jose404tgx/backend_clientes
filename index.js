const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3127;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

const SUPABASE_URL = 'https://bezcodjjxvwqimvejegh.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJlemNvZGpqeHZ3cWltdmVqZWdoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU4OTcwMDAsImV4cCI6MjA2MTQ3MzAwMH0.TbO3g6s3O3s1nT5jFZ8R1z5s1t2bH9K5cZ8R1z5s1t';

const headers = {
    'apikey': SUPABASE_KEY,
    'Authorization': `Bearer ${SUPABASE_KEY}`,
    'Content-Type': 'application/json',
    'Prefer': 'return=representation'
};

app.get('/clientes', async (req, res) => {
    try {
        const response = await fetch(`${SUPABASE_URL}/rest/v1/clientes?select=*&order=id_cliente.asc`, { headers });
        const clientes = await response.json();
        res.json(clientes);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.get('/clientes/:id', async (req, res) => {
    try {
        const response = await fetch(`${SUPABASE_URL}/rest/v1/clientes?id_cliente=eq.${req.params.id}&select=*`, { headers });
        const clientes = await response.json();
        if (clientes.length === 0) {
            return res.status(404).json({ error: 'Cliente no encontrado' });
        }
        res.json(clientes[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.post('/clientes', async (req, res) => {
    try {
        const { nombres, apellidos, direccion, telefono } = req.body;
        const headersPost = { ...headers, 'Prefer': 'return=representation' };
        const response = await fetch(`${SUPABASE_URL}/rest/v1/clientes`, {
            method: 'POST',
            headers: headersPost,
            body: JSON.stringify({ nombres, apellidos, direccion, telefono })
        });
        const nuevoCliente = await response.json();
        res.status(201).json(nuevoCliente[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.put('/clientes/:id', async (req, res) => {
    try {
        const { nombres, apellidos, direccion, telefono } = req.body;
        const headersPut = { ...headers, 'Prefer': 'return=representation' };
        const response = await fetch(`${SUPABASE_URL}/rest/v1/clientes?id_cliente=eq.${req.params.id}`, {
            method: 'PATCH',
            headers: headersPut,
            body: JSON.stringify({ nombres, apellidos, direccion, telefono })
        });
        const clienteActualizado = await response.json();
        if (clienteActualizado.length === 0) {
            return res.status(404).json({ error: 'Cliente no encontrado' });
        }
        res.json(clienteActualizado[0]);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.delete('/clientes/:id', async (req, res) => {
    try {
        const response = await fetch(`${SUPABASE_URL}/rest/v1/clientes?id_cliente=eq.${req.params.id}`, {
            method: 'DELETE',
            headers
        });
        if (response.status === 204) {
            res.json({ mensaje: 'Cliente eliminado' });
        } else {
            res.status(404).json({ error: 'Cliente no encontrado' });
        }
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

app.listen(port, '0.0.0.0', () => {
    console.log('Servidor escuchando en http://localhost:' + port);
});