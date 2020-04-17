Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B91CB1AE732
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:07:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8652CC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:07:22 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C86DC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:07:20 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id x66so3970770qkd.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lzZGiHPzAbjgK+LhrpZlmtXsvGWFSTECMnJetb6bjdU=;
 b=LJLKuYb/o2UR/Y+74wo2HHRNwpebcGaZL73e+QB5XHDOjWFPas6Qqkw+7ViH7kxpYU
 Rqc46RMJLoKNCBphuuFS5YGzKzxOdhz8XM8PUtDup583bIfntIBITqRSCv/7M2ZfIh6i
 kqlvxGeiMj6OpnJ//9qky5z0iSC0NESOEr3Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lzZGiHPzAbjgK+LhrpZlmtXsvGWFSTECMnJetb6bjdU=;
 b=ZEOTJPnzgmiziyMDQfBEsI9fAcUS7A4i/Hnx3ZDFRTpl9DZole0q4kst1Z9MqZ6hR5
 QMKYlOpenwDfQK6Rl26+qtsk4wnGcFfqfEdlCmrk9EOYrIJ5LESD8rcUC3/Sr6BlkujT
 F4miKf3kw0VapcVgn8KrxAAyMi34Gt6Zf+DBLC/SvrDiQF/muoStEHCvaAtsyPQIFyGd
 EvDqUFViQxv69eat3ZkFrcb809XnTKKDlq+N2viq5W+aWrDijaY9Z2QibGBNGoiVrjCo
 W8WiWd2Mw8aPqRDl59hKy40KaZRaw84Sal+h/als7ODLpk0wu8VoBRcs3ZJhvo+xi4bK
 PoYg==
X-Gm-Message-State: AGi0PuZlHK+aonema92BMt9QObAru9p/LZ4v/3hMSxZA618+QvlRPDyY
 /zq6+kKZKqMqgZMB2/Qb4MhaMpmAgyA=
X-Google-Smtp-Source: APiQypJoB48/B9Y3kXreNbHBdasLhmt2KWbUpQmXukXWl0+KEFP4dC6f0B4u4pG13ayH6QiefbAS5g==
X-Received: by 2002:a37:9d8c:: with SMTP id g134mr5487524qke.307.1587157639108; 
 Fri, 17 Apr 2020 14:07:19 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id c33sm14625037qtb.76.2020.04.17.14.07.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:07:18 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:07:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210716.GW4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-17-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-17-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 16/21] dt-bindings: gpio: alignment
	with kernel v5.3
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
Content-Type: multipart/mixed; boundary="===============8257204294310028162=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8257204294310028162==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N+qDRRsDvMgizTft"
Content-Disposition: inline


--N+qDRRsDvMgizTft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:10AM +0100, Patrick Delaunay wrote:

> Update the binding file for gpio, it is just an alignment
> with kernel v5.3.
> The U-Boot code example for gpio-hog (not directly linked
> to binding) is moved in a new file doc/README.gpio.
> [commit 21676b706e99 ("gpio: fixes for gpio-hog support")
> & 'commit 4762a9988ede ("gpio: add gpio-hog support")']
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--N+qDRRsDvMgizTft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGoQACgkQFHw5/5Y0
tyycBAwArsP4AFgqfL4P/vckq+xWmKu0IAkrgIi2M4yVO3iZFvY7jqJjlXfxmwpo
sL1PIc4Wm52+dem74wAFHTGH1KRAMtU5TJA3MV39X/vWJD7cD6TgTB0pTwRLYrMN
U8gjIA9cmLRcqhN3oxIw68QTM9KMW0H5jESPL88oZY1sGumdO8rExNY2nzqYP5DX
GKGcUpNL3tkqsEwf+mPUamvgrBa1v/ZAtuqGr5HZz39dQuTXCRJVuxfisNV0eRZs
CgvM5uVDP2HAG+UxUVseNORa9jMgGMIRR9rFohAKeULewOxMMLRqrgQakY/Rj7gX
j4EnKEMJUoCEOHp7/Xg+MYQ9s/q1Fbj9+lc41zHoRKFtPQ1+sEQsZ6BuyQkfRyIv
0EDzk7iB9DAGNjAu1vFm3zpJMalaCsmp4wi9akunwbNI2NC0FoOFq+2ClYZnUO2K
1NeS7ry/h4969abHJrlNYJq4feTbLfeaOg5VojX48p1V6P+4TOieYxj3BFAqDcul
ZHlc+sz0
=003Z
-----END PGP SIGNATURE-----

--N+qDRRsDvMgizTft--

--===============8257204294310028162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8257204294310028162==--
