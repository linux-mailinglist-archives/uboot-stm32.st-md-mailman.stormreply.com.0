Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 294592F8DA3
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:21:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E68C1C5717E;
	Sat, 16 Jan 2021 16:21:34 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77DE4C57187
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:21:33 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id c12so2787775qtv.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4RG7SW+LN02teamWWBKdo5uuAlEMfCKNcUNPsNHHVUs=;
 b=C5dWwc+nytJAkctIKWy+4ngXchYJ3B961X2okDnUCNXwwzhAoudj8UxKuJ8ZfjloBl
 kHOKFbJ7niYgxuV+0xrcV35+nGFh8gg7dyH7iT/8NunvXLa5Obgmak5T67AuF905hbLx
 Jq3FckK47GWd0DOCDY8DznhaJ9fvMGlXJZR/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4RG7SW+LN02teamWWBKdo5uuAlEMfCKNcUNPsNHHVUs=;
 b=kGFc3RPOmxaYsqfRQq9bobMMhgw5bYkc+miZ0YYkTfwn/aKeyJE8ryh7QIzN1P++zB
 +33p6hYFYcn/amh7/iazFTI7+rrzyY+2gUYf9urM2iPsUQfLGC9/8nSRLACGpHLIADwl
 4PfUfve6PoqS6IBAIrtDEQ9RYiUuIrCNT4TUFW93Epayzz6wBg7CJByqd6qxwESgSErN
 9RtLKrghMTCBz8uW/ScwxHJeCVvIVQddKkgctI4nM5YKbUgc/a6u7AW2ffZ9btO0szrZ
 UAbl3cNVfpupGvDb709liFKJOYpFlhvBfJxrYQkri1bKDKYr5yAdaiCCO19oBaRsx8V9
 aO+A==
X-Gm-Message-State: AOAM532X0u2/X8NwWdibiZSUAr/oFtFfHCCzJvmx/k52S+p/9Tm83GyR
 LdXfOOK1dKCavmWxj4HZ0glSCw==
X-Google-Smtp-Source: ABdhPJwdle8mSTMaao7IVpA1T7BDmy3Pglu/ErQ5P1zyzcKq0maZyQewsydLWNMhPiB0KLRc0TJd/w==
X-Received: by 2002:ac8:43d3:: with SMTP id w19mr16653447qtn.94.1610814092423; 
 Sat, 16 Jan 2021 08:21:32 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id 1sm7137707qki.50.2021.01.16.08.21.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:21:31 -0800 (PST)
Date: Sat, 16 Jan 2021 11:21:29 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210116162129.GL9782@bill-the-cat>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-3-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20201127102100.11721-3-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 2/9] log: don't build the trace buffer
 when log is not ready
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
Content-Type: multipart/mixed; boundary="===============6868803990525094799=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6868803990525094799==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Swj79WlilW4BQYVz"
Content-Disposition: inline


--Swj79WlilW4BQYVz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 11:20:52AM +0100, Patrick Delaunay wrote:

> Update _log function to drop any traces when log is yet initialized:
> vsnprintf is no more executed in this case.
>=20
> This patch allows to reduce the cost for the dropped early debug trace.
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--Swj79WlilW4BQYVz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADEokACgkQFHw5/5Y0
tyxcagv+MNsTw4nLEP0K2eWuYjVVygIrJdeema+rqb2A19CBIUYWUZaxLQswD6We
/mKxmrMWIDeACzq6QurrPxI4gGYv+OiEmqJmvEUivJznnv8zW17GtY7u/Mq3O5Eu
kzZOnglV8HBbKA3fUawA8a3PtJzz1UEru++kdG+rMLnYIG4Tg8ovk5s3x5LV5kjM
L8tXZXoOfDq1AE0BoUfApAnC/DcxtTMIt6+gXicewm4Gq+s7fVPWc4bJrK1xonmO
12TZCp/XtI0t+kp5g3qrva9DWTxnJ5irxVLm1vDqXkWqewfF0ylb6uTgXV9GdPLR
pG+sj7GhxNbzC5s2EcOyOoIKJZY36N0r6RZbvRnCi7g01JCh0TMfMWMaGs2qSa/r
ATJgsOazHQN7dEwnYwKW74PQAT1fc8PoT18Zta8qfxSN/2CGetxXJ6dvjoiPZNu8
wWNqaChcabsVmRr4HiVwKhAIVmELG7G18Q7ie8ruqz4v9h7WJ8wX91JElpqW8f5P
IdnRLXXh
=muDv
-----END PGP SIGNATURE-----

--Swj79WlilW4BQYVz--

--===============6868803990525094799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6868803990525094799==--
