Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EEE1496C3
	for <lists+uboot-stm32@lfdr.de>; Sat, 25 Jan 2020 18:08:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFF23C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sat, 25 Jan 2020 17:08:28 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22DBCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2020 17:08:26 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id t204so4592231qke.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2020 09:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dQgXU0XZmZtRQZMaqlx9DFODXnRy/ZDqZC19GIp4s5s=;
 b=kHZSOBMrkKAwcm9djuZBPFrA+vXWHm4XxASWJ87sSs0ej3H1FCsxenBJaikZuU0Pby
 9GHLdufBsjjck/lEIz8wRTX+hbjsxl0X5Aj9ne8GX9UTwUSzMPgA+jklZa5wgyZuzQLk
 l8ZVSItZEE0VQolildZNfTN+mQqLMtCpX7qBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dQgXU0XZmZtRQZMaqlx9DFODXnRy/ZDqZC19GIp4s5s=;
 b=ohqVvRDwazs24+6G1WQdH0ZbN5EbusaZiFVbRVveNCBa18Mpdj0a65JNs3nKW4VLgA
 7Op61z2CZ33M2djsA9oOomDR0hqPPWmkPYRrRMdMedz4MmxvIEyx2I6NW5e5yvspFcWG
 cmfSmAhZXzEo1agnQY/kljOxLc07qkS6jAretmhg2n2kY1EfEx460qcxkhFEeSCx9bVe
 8WzYAQm1Quiu6Ofy/4+8NTJIPrV46uVcQgEsGQOpxc98h8p1D3Tjpgb71LhMjiFuXZY+
 Ss+yOc0apEHWBrv2tbqtrQlYqTvIs/T26D1APW/Tvj3pPTF46wztzsZbexwyFvfN8X2o
 ygkA==
X-Gm-Message-State: APjAAAUCYEkeadpxBVHighz5bmclbDXT+iC+ksryvxZL9RwgZ5IuF+bK
 bqipV3FDQUVZHl/1rAi7/50aOA==
X-Google-Smtp-Source: APXvYqyJ+2b22e6cf9v8E4ESlR2G+ALR7m3FZvOEASkLtjapsJlein7vie/aun0B+SgCB5W1CZMl7A==
X-Received: by 2002:ae9:f009:: with SMTP id l9mr8749153qkg.259.1579972104854; 
 Sat, 25 Jan 2020 09:08:24 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-3dc3-97ee-c77e-aac0.inf6.spectrum.com.
 [2606:a000:1401:86dd:3dc3:97ee:c77e:aac0])
 by smtp.gmail.com with ESMTPSA id f17sm1190943qtq.19.2020.01.25.09.08.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 25 Jan 2020 09:08:24 -0800 (PST)
Date: Sat, 25 Jan 2020 12:08:22 -0500
From: Tom Rini <trini@konsulko.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20200125170822.GA26536@bill-the-cat>
References: <1567583602-17022-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
In-Reply-To: <1567583602-17022-1-git-send-email-fabien.dessenne@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Lokesh Vutla <lokeshvutla@ti.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] remoteproc: elf_loader: fix
 program header parsing
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6039096593428505097=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6039096593428505097==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5DFjIrIHbGf/FHYW"
Content-Disposition: inline


--5DFjIrIHbGf/FHYW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2019 at 09:53:22AM +0200, Fabien Dessenne wrote:

> Fix an issue where some sections are never loaded : if p_type is
> different from PT_LOAD the phdr pointer must be incremented.
>=20
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Acked-by: Suman Anna <s-anna@ti.com>

Applied to u-boot/master, thanks!

--=20
Tom

--5DFjIrIHbGf/FHYW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4sdf8ACgkQh/n2NdMd
dlIpaA/8CL6v92oeg696/2o1semLs6GixkakXLGy7jaGYQqwS2iFst0Y3nZcD/wu
QnhpxgSef4ug12c44ihJLy34NKJ8vnlvJzMOkp/SXxmBxdjIKXD22dk/oejs9eFM
QBqgZqvHhH6TZw/pG+HFw0GTY3jW63FdCRIFboI9uSxkKFHyyXjdz8PPMCd6HASb
/4VAJ01SODxThE6L6gTIdf5JmkdGWTo9Of7pUhGwOb47vzEQxXRBpO1a4drOldQo
DVLAmBs2cb0h8tC//i3/tYhy1hBFBFPASU0LZV6WcLac3aIWGjGT/QYD93W3CozH
saKzp16gz9DZC/0FnfgawUH3NqqaXai7FTg9JP2eBBPYU7xvcXC1tCMAJ71a8PqA
wAroQbgsFywJAV6yl67MeMoFhh231FN6xw8NFU/ReEpNs/QwmK5Es+rwuCs6Uu+I
Os/4bZLHX9AVDUBxV0ZODbYZZNQkjENnRwr7RT6LtVOGnbGtahHc8dxvqplGlRU+
8dt1DIp2itrkfu+KhTgA7JedONqPhMQPii5pP65YfQcf9NIy35tYe0ReKsCbma2p
nxFGuls/nWjktlRYkmvY19eHg70bLXEMzdUaMSeRD7qwzYSV263rehBaJJoLhM6D
caTdEtLlFa31ZzLrVdHZw/0Jh2hVSag/QijQUnYK9n2iLvr4BHI=
=GT+N
-----END PGP SIGNATURE-----

--5DFjIrIHbGf/FHYW--

--===============6039096593428505097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6039096593428505097==--
