Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CAC1AE743
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:08:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 870F8C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:08:56 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A24EDC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:08:55 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id v7so4048130qkc.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SfPDwr5Vu5KzTBe+SjSq2It8Qc1cuoKjgzsehrrPlwo=;
 b=Ib6MIDA9m5IDhklyE/aG6JyRwghtKiQeV9zWD+wOJQ/1N0VdH36NJVtLY8plxzGLeF
 of4ncNbbulZ+cYUkEqt8eGwegDMvg3XQK2ltQo/HIbCzD3IurSUnwO/qE+E/mnp8xVet
 SVN5/ijqFpwWmiWg4QHHT2XNYKX9hHlNW+7Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SfPDwr5Vu5KzTBe+SjSq2It8Qc1cuoKjgzsehrrPlwo=;
 b=JCt99P7NFnEEpy38bb/t5Oksd0qJt1aYsqXlrWNDWdZ9IMXzRKWG9X11SGkjSgFsLb
 Wqswkc5iSWU3WVLS06EgnXeoe87BQN1tdrSUTb5rlyNE874DaF1B+c0kTIV7cB7D+ADi
 wTtJ+XbS6S8PousMmbC2ouDQff1KiiSJwzb1cLcpMzIfPwBbYMWG0SI37kg16vRujCWI
 vq45wDmIj2Ylgd09D5FtUi+0uXYrkl5WQuYYpUrIFXbkM+1GM1FMalQvVQimA845D3dj
 IJ9zibG6V6j8RhP+aMa0HNpua5YFv0vcsge2DfL82kZeS5r2EHm+SJTCq9y2/BBvidmL
 pYdg==
X-Gm-Message-State: AGi0PuaAqZep0OFy2atXakBlXlMm5GjfhCEpSlGBhWGwTCRMTQM7MDr4
 CUiXrcNFDx+YWUAOKj308RwwYQ==
X-Google-Smtp-Source: APiQypJixeXVNtEjCYI2FOm1ojvtjOlHQv28sm/NKI9OCAe41OexjtsKcNze9ra0mXGx8ZAMSxAzUw==
X-Received: by 2002:a37:4b08:: with SMTP id y8mr5356446qka.494.1587157734490; 
 Fri, 17 Apr 2020 14:08:54 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id s14sm15652714qts.70.2020.04.17.14.08.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:08:53 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:08:51 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210851.GM4555@bill-the-cat>
References: <20200310091505.24862-1-patrick.delaunay@st.com>
 <20200310091505.24862-5-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200310091505.24862-5-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ovidiu Panait <ovpanait@gmail.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v4 4/4] board_f.c: Ensure 16 alignment of
 start_addr_sp and reserved memory
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
Content-Type: multipart/mixed; boundary="===============2738648189536242769=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2738648189536242769==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r21wuLfwIlf/vvzy"
Content-Disposition: inline


--r21wuLfwIlf/vvzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 10:15:05AM +0100, Patrick Delaunay wrote:

> Add a function reserve_stack_aligned() to reserved memory with 16 bits
> alignment after the stack pointer (gd->start_addr_sp) and use this new
> function in board_f.c to reserve all the memory area (malloc, board, gd,
> fdt, bootstage, stacks).
>=20
> This 16 byte alignment is needed for cast on struct pointer
> for the reserved memory, for example:
> + x86_64 ABI: https://reviews.llvm.org/D30049: 16 bytes
> + ARMv8 Instruction Set Overview: quad word, 16 bytes
>=20
> An other alignment value could be needed for other architecture.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Acked-by: Stephen Warren <swarren@nvidia.com>

Applied to u-boot/master, thanks!

--=20
Tom

--r21wuLfwIlf/vvzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGuMACgkQFHw5/5Y0
tyw2XAwAredV8dS8iO7pKfCWTiqjobRTAsTs3toLZmRJ4vRVhB/oLOIvvLoQV4+z
TzPxK/dYFQ+xgn217ynr57JNPJ252jlk0yNv5egyUx2h6hL8nNAxQwQQv5NLokqr
fYXeiEFFyitOBeQ4ay1P0vtKnhhrwdNaYF0dAyjyaiNwrexwH+iPu/FYfi6ARlZP
eflRbe/21bN4QcwFP9elQqJLOP1Sbj1t5dS9TaS7GrdeM9imd57IF0KPSdp4EhJY
t+nLcDhDRiThfMR6Vt1gR5/YwqVgLBcgGtr5e4DpC7MRRIw003PKKrNIYS/1TRzu
+CqLgj3gf6n8Ay5tGzJmJ5fyt7BVX9z+GxyaMd79cn/RLyV+kX7P03AmgyBVdr/+
L10dpdcgr+4Y9SKipDga0jjgoimZ7EYRtC1iDsAAZ85lO09e/0UzVpgtdO1+BWaE
vWZpbr9hq4v8J6uAmwc+RUS6lcW1ByjvRk7ddN5CEV59Zq3QijEMn7PhVE5Lo1mB
H8cbIwoA
=bCxU
-----END PGP SIGNATURE-----

--r21wuLfwIlf/vvzy--

--===============2738648189536242769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2738648189536242769==--
