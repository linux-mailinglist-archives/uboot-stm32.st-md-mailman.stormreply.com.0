Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D597F4150A3
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 21:46:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 241CAC5A4CD;
	Wed, 22 Sep 2021 19:46:20 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D3ABC5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 19:46:18 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id 73so13887302qki.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=S/VGCFGaUi9SPmvPck9LQ/G0mZpKvSsFSxk34930sT8=;
 b=GnhNdeXu3RHjQGGu6sDBti/9CN/8QzfEo62Glo+m5Gaeap2Al8bKLnM3C/brN7KVZD
 A59wPd//h9QAjkffTxAwLVwIDCbUdF3c7q2ijpAPhofYY2YpOpx7BDpthVhrsvaPDINy
 /YAz2NQdPQqL0GJFwaczKTjKmIaJUA7g8UgQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S/VGCFGaUi9SPmvPck9LQ/G0mZpKvSsFSxk34930sT8=;
 b=zafHgi+et3g9Wv3CUa6RxW5b4U1EVg+zvU0wGHlUNyhIhWvE0DNBbBPm2L3YLTb2KV
 Z3o5I1d99Svflzs70tCg56rfsJCF9SFgetZswDjSFENpTeKP2aFx0hIohRpd4ei4ydn2
 fyxmlkxCyAH5M1mkf+SpYgng0IB/eMxT35m4oL6FZ0XVVLiwZkCg4Wsl4jN9twW8aFBs
 jy9yK6mafd/krR5NF3Zi5Kne21oM7G0qs6Dk9BB/FLATQI7JAmDJDcQxsZ1kVaFpASS2
 2Lga46MMbRyryycUSQHnOFlLPQZoUJJ4jUE5dshgTOoXOv5SQCuNqiPB00IIkWc6nZEz
 tYEA==
X-Gm-Message-State: AOAM532H9e7hbwGAPKwmi1LbpZu9793UletGQBgCXcIXJz2WqLYQhvdD
 jlySKAKxHQSS3Hlj+ln1w2sUFQ==
X-Google-Smtp-Source: ABdhPJxD6yiOu6YI2/9cPRTdjGumIECv3XV+aYdQtaIgfArjUrtuN+EH1dd691S8ALYu3EJfO7dosA==
X-Received: by 2002:a37:648b:: with SMTP id y133mr1092855qkb.83.1632339977698; 
 Wed, 22 Sep 2021 12:46:17 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-a58e-d475-4878-38e2.res6.spectrum.com.
 [2603:6081:7b01:cbda:a58e:d475:4878:38e2])
 by smtp.gmail.com with ESMTPSA id h14sm739394qtx.69.2021.09.22.12.46.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Sep 2021 12:46:17 -0700 (PDT)
Date: Wed, 22 Sep 2021 15:46:15 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20210922194615.GD31748@bill-the-cat>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922210536.6c9c2f9e@thinkpad>
 <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
MIME-Version: 1.0
In-Reply-To: <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/2] mtd: spi: nor: force mtd name to
	"nor%d"
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
Content-Type: multipart/mixed; boundary="===============6978892088913216808=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6978892088913216808==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Content-Disposition: inline


--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 09:24:24PM +0200, Marek Vasut wrote:

> I am talking about using nor%d in MTDIDS in U-Boot UBI code to look up fr=
om
> which device to attach UBI in U-Boot.

OK, so are we not able to pass in the correct name now?  Or just worried
about old environment and new U-Boot?

--=20
Tom

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFLiAYACgkQFHw5/5Y0
tywzQwv/ctsBKvMyIpcyGdBuiYQdVjM8NcMNu2TduuGBmX80VhXNmAi4ATpV+ZGm
76aI7iHsLnfrQdLA1jJGFHuxq489JMcoS70S7HsOPFH5GM3m7dbL7hm3kgObttyk
MxZmXnF/u3JhnQWWZujB4rBzIEo8X/W3JfVhixBwpz+vdVknJECQJx0oMjQa3Jl/
NeQtz5Zzmg5SVymmggPE2Xipj6X5aC/t1yWxSJFj45h43BWoS79jUI5YhY833EtG
ta554dfmMAbSHTSe5MhtY8/sKro2q9MallQF5QECuQXrV4njBHDWpRvKZK7vMWix
DVsYMUWLsS/xxcCwbHcd5sGTdUluPQDJtfYj2H1M8riCqs0ThvWTcHiCd01YPM6P
NoNfbn6HkHcgu1Sm1RiVx51kGYOMsNQKYbofqhBulTHG4C+8FlUUnmRDDpY+Fh5w
BNsUYxickRZBBJZVYRfSERzQH+IyVqQaRuHl3eTF6/MzHU5SDNsFhjrqzEGJ0sLa
u9JF4slv
=KtyX
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--

--===============6978892088913216808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6978892088913216808==--
