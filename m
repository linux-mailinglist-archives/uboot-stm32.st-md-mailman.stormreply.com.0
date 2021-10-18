Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB74328A1
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 Oct 2021 22:50:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29163C5A4D3;
	Mon, 18 Oct 2021 20:50:41 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE516C597BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 20:50:38 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id n12so11010976qvk.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 13:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Yea4z/Qoe5eJQ5z5z0GBr4NRBlIgzljTjxNii/CuOkM=;
 b=clL4zczoaM8zodVBjgVVIFTDu0x4z21Rc+hmmcRZByf0iZT1+F4mC7DsjhuFH11voV
 C5jdLhyOp9fO1ELkTQj1wNbL7QSOs6h4Xk/yoA30KttpSdlpHgzqAuXwRtRTCuP3e0rW
 49YVbzh8QwOqaB5lexNtRa6oxKacvgkoVVkyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yea4z/Qoe5eJQ5z5z0GBr4NRBlIgzljTjxNii/CuOkM=;
 b=DzuYSAgeWCKdUWUK6kbCa5Ul4Zt8XeykkDQCR/ubg7QYLSHGkmeuaryeSh0o5FXPYJ
 r7uOZGW3Oo9EXDV/7Bd4IN465GuCV/+N18mQRxzpQ194PzJzun9v0icziOCd23KgKn2o
 rZyHxgc86rK0UI9RaczjWuS/ZgB0OrT7rvhvPyFlAsCwsJwFgOLyZlaX9OAfkxcAANRR
 1pLDGa1wpH786bHSdoS1nCSWDXen7XBCh+K/htUciXRygpqvW8S6rkUL3aHAgK2pznBA
 YHpW5QOjY74As8mAv52zgYKqXHb3hdzTkJKMPI2shno1Aq9t9Jjd6JxMNhApJsXQplxt
 cjQw==
X-Gm-Message-State: AOAM533TWckPU330bfO3PbL9857ERSwWkeO55+4q/aB18RBMM8EELpJt
 Gn3Y6dlnPDwwbbAxZEikIfaGtw==
X-Google-Smtp-Source: ABdhPJwj9rIJfJHsC4TZU72CdBOjHIZTL8z3xSBTkcXVBi3nze0wOX5HlH0zTJGsagEALGvkBeXfzQ==
X-Received: by 2002:a0c:b54a:: with SMTP id w10mr27716585qvd.15.1634590237737; 
 Mon, 18 Oct 2021 13:50:37 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-b5ac-d4ae-96e7-5d3d.res6.spectrum.com.
 [2603:6081:7b01:cbda:b5ac:d4ae:96e7:5d3d])
 by smtp.gmail.com with ESMTPSA id s17sm6908587qkj.55.2021.10.18.13.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 13:50:37 -0700 (PDT)
Date: Mon, 18 Oct 2021 16:50:33 -0400
From: Tom Rini <trini@konsulko.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Message-ID: <20211018205033.GA3078606@bill-the-cat>
References: <20211015084243.285423-1-ilias.apalodimas@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211015084243.285423-1-ilias.apalodimas@linaro.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 Zong Li <zong.li@sifive.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Heiko Schocher <hs@denx.de>,
 Asherah Connor <ashe@kivikakk.ee>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ramon Fried <rfried.dev@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Wasim Khan <wasim.khan@nxp.com>,
 Harald Seiler <hws@denx.de>, Nandor Han <nandor.han@vaisala.com>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Green Wan <green.wan@sifive.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, sjg@chromium.org,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3] sandbox: Remove OF_HOSTFILE
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
Content-Type: multipart/mixed; boundary="===============4550308224714548319=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4550308224714548319==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 11:42:40AM +0300, Ilias Apalodimas wrote:

> OF_HOSTFILE is used on sandbox configs only.  Although it's pretty
> unique and rarely causes confusion,  we are better of having simpler
> config options for the DTB.
>=20
> So let's replace that with the existing OF_BOARD.  U-Boot would then
> have only three config options for the DTB origin.
> - OF_SEPARATE, build separately from U-Boot
> - OF_BOARD, board specific way of providing the DTB
> - OF_EMBED embedded in the u-boot binary(should not be used in production)
>=20
> Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> ---
> Note that this must be applied on top of
> https://lore.kernel.org/u-boot/20211011210016.135929-1-ilias.apalodimas@l=
inaro.org/
> changes since v2:
> - Rebased on top of the updated OF_BOARD patchset
> Changes since v1:
> - Added internal error value on board_fdt_blob_setup().  Arguably
>   we can just check against NULL and simplify this even more if we
>   don't care about the errno
> - OF_BOARD is now default for sandbox builds

With the previous series applied, this breaks xilinx_zynq_virt:
https://source.denx.de/u-boot/u-boot/-/jobs/337428=20

I had a little trouble in general getting the board to run locally, even
without the patches, so I didn't debug further yet.

--=20
Tom

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFt3hkACgkQFHw5/5Y0
tyxjFQwAlT/B73yQ2kDUdJAWyfbzUE7Ez7XUqsXbpXvZUNc5yKCBKJbDJBRcRRgJ
xj7y8wAlHQYH9caaDzCpBAru24gTr15Z1/rjclLEg6U7vfDqztA80Ikwdz76eIg9
mwm2o4sQ85q1sQQiepm6iEj2tZqALvsXLcIOg95R76Dz/FqKXsI4Q0VOCqjA3Jhr
IxY/UzF6gbq6komEfAmrGnAuyoi0+LSPPghQXLwuSheNTEy5XBI5Z4R9JjLr0fhf
weCiBSOrv7jqldzdtv7p6kFqDWngVxNfp6KHp5/CZa3iN1scCpokXPnK6YYCLZya
sjUzI4GsGFHsEBxEss3Ps17iNN/SFaSLVrgAX0XnTU4KYDUYGw95g4TX5BJ342Ig
hDJRxuoJGzN6VGkxducv4a+nlbauUgy85c+8mslFeiMIcMY+OQYhLIo6YoniLlpV
vskXfvhHvbtJKAkCB66H4IAe6Ez+QuORsHBjqtsp5M040XIDzRZKPjrMZupo9sxJ
iI2qcNHP
=45YK
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--

--===============4550308224714548319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4550308224714548319==--
