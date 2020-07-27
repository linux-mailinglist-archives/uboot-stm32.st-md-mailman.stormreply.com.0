Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1085922ED5E
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 15:33:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD1E9C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 13:33:13 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7850FC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 13:33:12 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id b14so13473437qkn.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 06:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gFLoinIJFuSYRPq08Qg/ta00065Jeh7nCicfXHQe3S4=;
 b=qNIqx87B32SPrmOiUejlhSMR0QRqEO28JZqFvoKkJLOQW9tbAIRk5cYK/Dw7kLTJ3r
 UpDg8F8/zCa0wH9R8I2lTsCgQTu7WnXhN9HhHrZtxvpoNpSxEQyuzfTz0Y1dJQjumkS8
 tjzVTjIoHUaHiO7E16xpO/wFgboV81VF0CyMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gFLoinIJFuSYRPq08Qg/ta00065Jeh7nCicfXHQe3S4=;
 b=PvfNdcbJEbqnm7VWDqDtThy8C50cf6UWbAGOSne87HPT9YieYCGFPnGAYY/q3hxSrP
 Q2BXS/a/TGq42BzwF4X42ksrajAOion1atzjA0Qn7ki1pq4cmGd7frnEyX6vZ10/lmEt
 Dy4H/ZsVQFvA+jFsc+MChn/97VNH+S5uRhAOImiEtWqGYKq27V/XJoPOmsE0UcCdgJPX
 BiGzyaEfJiXL/kUjsQOXcOraYjqy4WFAb4G/unoxe0NJDxydTVKLanH7rm4Ml0SdEGQ0
 nCG4hgB2gcv9ojfq877DgTGwN3+xgxxQDIByYcK6CV0OEpb5tNC/6X0ovm2IxbD9GHpB
 PISw==
X-Gm-Message-State: AOAM533PM6f//R73fYkKDxuhRxY8qTv1K4zcaWRbbJMG6Eiu32iWZWtU
 JP1mJJjB4IVSjd3rC2Y4L1dhjA==
X-Google-Smtp-Source: ABdhPJzEuk5H43N6TD6D0fmy0yhqkPrGFO/X3Exmo1C0l6ASkeGIVRRacng2x8WPjVmcRx+K6sUVSg==
X-Received: by 2002:a37:468a:: with SMTP id
 t132mr22099361qka.467.1595856791416; 
 Mon, 27 Jul 2020 06:33:11 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-f1b9-a518-346f-c376.inf6.spectrum.com.
 [2606:a000:1401:8c61:f1b9:a518:346f:c376])
 by smtp.gmail.com with ESMTPSA id z17sm16726842qth.24.2020.07.27.06.33.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 06:33:10 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:33:08 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200727133308.GG6965@bill-the-cat>
References: <20200615083857.3825-1-patrick.delaunay@st.com>
 <20200615103839.RESEND.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
MIME-Version: 1.0
In-Reply-To: <20200615103839.RESEND.1.Ib0b23085d678421d429580e13560b4dad27c9378@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Peng Fan <peng.fan@nxp.com>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH 1/3] env: mmc: allow support of
 mmc_get_env_dev with OF_CONTROL
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
Content-Type: multipart/mixed; boundary="===============7283672465366144846=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7283672465366144846==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aPdhxNJGSeOG9wFI"
Content-Disposition: inline


--aPdhxNJGSeOG9wFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 10:38:55AM +0200, Patrick Delaunay wrote:

> Use the weak function mmc_get_env_dev in mmc_offset_try_partition
> function to allow dynamic selection of mmc device to use
> and no more use directly the define CONFIG_SYS_MMC_ENV_DEV.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--aPdhxNJGSeOG9wFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8e15QACgkQFHw5/5Y0
tyy5wAv/WACVrMg6D9unkIe+uCRxgdHZVt6Ofj4HUcTVE+geUdFnOEUgZioPDrFM
dRMFa6kFHr+AEDzngd4AtO/y5carPhskEVwbIE6sDIUl9BvZ9LEI+d6gDAsXHO9Y
a3njuuqElwLhO0TA1dIWLK5CgWt+Uzc77AfuOwGD+Xda2mCWT69uQKFkSct2MbU3
7ViWDr6PtsOCN47s1A5HOjFnXMecgWf/FGpn9UjdbTfaWscnCR8PmXeRYVzKrHP3
KBWXTfFQ0KQW+Y1LWkUvmi2Xq78PNtpGKAnzPvK7teZ5fHk7bdufmf5oc3P0V4DD
W2ErQA6M5aBP7F2avFbnpCYskB4DCK5atOi6bpaS3vpeZkEX4BBfNpIfxplWMA0C
umFsMNUfURnM6Zb02d27pvkvbpWOz9W8iuPa5LislnGjuzU7kOS0XrEw12SxKrL4
boQYPLHyoH1JyKBTy6s/BXFGmUQ/4nM0BY8WFm+Oa58Z/58qn+8NRD6bTXBorD3k
aroODZrL
=Ftr1
-----END PGP SIGNATURE-----

--aPdhxNJGSeOG9wFI--

--===============7283672465366144846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7283672465366144846==--
