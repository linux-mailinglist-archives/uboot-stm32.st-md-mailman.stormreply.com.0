Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F022F8DAD
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:24:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F08DC57190;
	Sat, 16 Jan 2021 16:24:31 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43E52C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:24:30 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id 22so14836402qkf.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cFIvA1R6RYvc4vv+5GkxYL8AC9QBVXqq9S1JPbyVRlU=;
 b=P/Vez5UIYhmMvIrSMUaBSC5qrfDbITqKqot63Yn7hk2lGG1R4+jkghFTtvwLHiCFCQ
 2b10Y1VdTDhyLnt4CzV8bsU6U69sfm3RPfLu5yorznr+yanzf56k4Bm63Nohf1IFSJu4
 iz3cWNqHJT1ZmQApoMOQ94lz/bZ04VdIgpeRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cFIvA1R6RYvc4vv+5GkxYL8AC9QBVXqq9S1JPbyVRlU=;
 b=RZpUntzehbIDgu43hOsYEj8is5iYsbMzS4QrkhsfYpVWFi7xaYd8RS2DBVwlWhSM7e
 Hyo0RmqLUhtEQcm9q9NgE6X1ILSpcJLejDwUJczQdVzhE0t1RYdbnPxn4zRwAQDQpXCe
 jvwhwcEzm2vCeJ5qtL15xlt8ggnjyPRDCEpGKzQ6qKrET/6pqE9yZnjRCH1nD5preiNi
 2PJbuQ+clMsPTX6Z2y3Yms6yOSfEaFMdJp7QAMUu3WiGs77s5wK7Jfr9e2dOY81nQjAy
 TAuNvg6joE7GIWtOa6L5vVT18jhUT8ppFHuW3pqreDqRJZCqlHc5fuT5C+nebmjAf0Bk
 jTbg==
X-Gm-Message-State: AOAM533jctytsaLpKtq9sGd3PbmNcu7bUdhOaK7d6TBP8jUc/VBcFVzH
 JBZUvHNFwdZ+nrG+vd6h0VPucw==
X-Google-Smtp-Source: ABdhPJwJQ1nIao0F02RMAKx5yznarmoo+MOw3LypggYS2b1/7Wm4zxffQiBNm2l70kEPzjF+sVAJsg==
X-Received: by 2002:a37:8202:: with SMTP id e2mr17661748qkd.412.1610814269296; 
 Sat, 16 Jan 2021 08:24:29 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id x49sm7162684qtx.6.2021.01.16.08.24.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:24:28 -0800 (PST)
Date: Sat, 16 Jan 2021 11:24:26 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210116162426.GO9782@bill-the-cat>
References: <20201218114646.9902-1-patrick.delaunay@foss.st.com>
 <20201218124642.v3.3.I3e15d39becc5c180a3be52571bb570e29c6b4cd0@changeid>
MIME-Version: 1.0
In-Reply-To: <20201218124642.v3.3.I3e15d39becc5c180a3be52571bb570e29c6b4cd0@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 3/4] console: remove #ifdef
	CONFIG_CONSOLE_RECORD
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
Content-Type: multipart/mixed; boundary="===============4438267138206020401=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4438267138206020401==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mWXp4lmU9bb5aCfX"
Content-Disposition: inline


--mWXp4lmU9bb5aCfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2020 at 12:46:45PM +0100, Patrick Delaunay wrote:

> From: Patrick Delaunay <patrick.delaunay@st.com>
>=20
> Add helper functions to access to gd->console_out and gd->console_in
> with membuff API and replace the #ifdef CONFIG_CONSOLE_RECORD test
> by if (IS_ENABLED(CONFIG_CONSOLE_RECORD)) to respect the U-Boot
> coding rule.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--mWXp4lmU9bb5aCfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADEzoACgkQFHw5/5Y0
tyzAmQv/SEA23EX8xZ9XSRe14DmWB19h9IBLGkT1g5k61WThQ+ovNHymhC+bI2go
iQi1/nHdnRWT1FykLNbf9oVrCnPx+yxR57Hyab1f4+js36jfxxxFO+w4uzwD+nWy
l7midO/+eu/y0P5ePv2oQHE4PSbb46LGKRHR5trlyKEc3doWxunhMQhTuQTuh9hz
0hL9phnS+ViVi1lDQh27WpKRt/18nv7qaayKaSNN/0FHP3UtavrP3q1S44fekaAh
PD7PtwTU5bUkKR0cVnLVbWPkkqOVcjunAmoYkKFxh/JiM+kINyeMGyzrNMZlnti0
nSAEMEbDxi94k3R/zTr5sw8QcxhRXtfO/b6a+P983OZfXgx6PzNPAXSmwUnA7+xD
qcfctINucoPKwFvO8TkU6cUFQgA4y3mM9S9H4X53q0DelsJsWOnKn/DToGrPgKTS
tMqpcc3sFkcJ7XbvoLGHlClb2IaRi+hBfo8SDu9X725ZLNL6lIMlBkEfHr5H5Z3p
ANusl7KJ
=RMB5
-----END PGP SIGNATURE-----

--mWXp4lmU9bb5aCfX--

--===============4438267138206020401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4438267138206020401==--
