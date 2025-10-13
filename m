Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD109BD49AF
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Oct 2025 17:55:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE10CC349C5;
	Mon, 13 Oct 2025 15:55:51 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E50ABC349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 15:55:50 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-6500448067dso2410342eaf.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Oct 2025 08:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1760370949; x=1760975749;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K0FeejrPTIOqlT5FEyst2N1ZzZD5C+GH1ElFuyxRfZU=;
 b=aQYUriZUbWGg2c2Qn/xCCbe3o46bBxCQZU6eyiFEeTL3HdZ3cz+jMuf0l51rG0bHLO
 6p3YOjKa1qB8qYKyWI0C5uhgQgLZL+sWVZON4EEYfNAnspUr+x7ZnRTTc8vsTXMv6A2F
 EbW/bj23udFLedsNX+xrHWC4iVBlUiLUt7zrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760370949; x=1760975749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K0FeejrPTIOqlT5FEyst2N1ZzZD5C+GH1ElFuyxRfZU=;
 b=EaEOOI5IRQzq8tixre/a9HeJtEH/qQxTTxJ7wce5Idxoln2IWjQZuZ6h9BbwxTRa36
 LmrtosVcM2Elh4QJPfMwRC9ZlikWmPAIUHenajTHyS/eCEIdqhR2B6cKGcreSyEkQIhT
 h/GxCjjCaUo1fTqC4Ekoxr0CHAYJNG475Oaoh3vO6MJyVgjAvMZNSHvDy1QQDqVsyMPs
 6QtbPaPzob/5cv7oZMWh7nV7nhVnyyI9LXcXsO/xHhULU8CzU7yDQHxPzPPgl5L09iPo
 422gXzMl3/PjuRJ/g/eX6eXVZXnVLFGpkOUcg2CAa9xn84axcNnovg40ZBSR9ihYFoel
 4NOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiGahg7IFux7JQBv0Z9qtZ1odTz94YqSPzBDnHW8EyKUhwnMggNp6Ua8gf+X4Cp5nc7geLNwkf1tDXmw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyTmk9Tu1FxmqZMPpCV7wL3K3sHpF7KpGbes8c8xppIuH0N4dL5
 oUq/TNjjMRevWyHbp6XcD2XYOyD2fIBcXo4ozV3rC9SAxbl/0lQ35XdiYHIZaLclwHM=
X-Gm-Gg: ASbGncsabadivgI8BXnznW78ZGcloam8QGJNQHXs+mGu6Mz4RZTmbA4EtAPbJRXMsTv
 scNXXr/iegyhiRaQJHle2R+X/4bGbyNXbZkbPOuobQmMV06tXl2TH8fAoXJiCzJUWQ/RNIvmg1W
 z6skcUotn5cAlxnR/HeDBHU5O5N6DOskmIftj7Ul6I1FP8R/mpwbIzgGGBh9+e2q7Y7QWnwK5vx
 FVrcZujRos565kuiwyIp9KCxp7IIDg+hqk4jMlBhaS9vatvbizfh2E+ZzEmGHFCMCT6oWDQK74N
 zQmwZwdbnFU123zVR4EA4RusVh7U1cDJKir/J9I0TotcvPKU09pvHuwe/PxnvRNZXfmtu0F78pG
 fKJeMsHWaN7Eca/S4p4SF/IxFw4NDMx5slpiCtVk70jFzH71llF0TEjfJ7whc1AcJmC7c/K5c9y
 kdGz3ro1Mi20wTIMcFBk8yn1HiiA==
X-Google-Smtp-Source: AGHT+IGrcCu+wK7pPghmsjxCtUaTA/lYrKgnZIZ5f66iNTjmnUYrVNM8NxTgmMEGOHDPaeEk+c87ww==
X-Received: by 2002:a05:6820:5053:b0:64d:2b5e:ad11 with SMTP id
 006d021491bc7-64fffe25dffmr8464114eaf.8.1760370949577; 
 Mon, 13 Oct 2025 08:55:49 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-106-235.totalplay.net.
 [189.203.106.235]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6501812f4aesm2705062eaf.1.2025.10.13.08.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 08:55:48 -0700 (PDT)
Date: Mon, 13 Oct 2025 09:55:46 -0600
From: Tom Rini <trini@konsulko.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Message-ID: <20251013155546.GJ6113@bill-the-cat>
References: <20251013-imx-rproc-v1-0-fb43a3fafcd0@nxp.com>
 <20251013-imx-rproc-v1-6-fb43a3fafcd0@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20251013-imx-rproc-v1-6-fb43a3fafcd0@nxp.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Udit Kumar <u-kumar1@ti.com>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>, Ryan Eatmon <reatmon@ti.com>,
 Andrew Davis <afd@ti.com>, u-boot@lists.denx.de,
 Beleswar Padhi <b-padhi@ti.com>, Judith Mendez <jm@ti.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Hari Nagalla <hnagalla@ti.com>,
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@nabladev.com>
Subject: Re: [Uboot-stm32] [PATCH 06/11] arm: dts: imx8m: Add remoteproc node
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
Content-Type: multipart/mixed; boundary="===============2500548729373118186=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2500548729373118186==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5f4SvGdaKPbGqn2N"
Content-Disposition: inline


--5f4SvGdaKPbGqn2N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 10:49:25AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Add CM7/4 nodes for i.MX8MQ/M/N/P.
>=20
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm/dts/imx8mm-u-boot.dtsi | 4 ++++
>  arch/arm/dts/imx8mn-u-boot.dtsi | 4 ++++
>  arch/arm/dts/imx8mp-u-boot.dtsi | 4 ++++
>  arch/arm/dts/imx8mq-u-boot.dtsi | 4 ++++
>  4 files changed, 16 insertions(+)

Why is this in the u-boot.dtsi? We have
dts/upstream/Bindings/remoteproc/fsl,imx-rproc.yaml and so your updates
here should be compatible with that, yes?

--=20
Tom

--5f4SvGdaKPbGqn2N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaO0g+QAKCRAr4qD1Cr/k
Csj+AP9VQGMX9cTAjJpR5z15mdtHeuxCCXPtupmLmvDYpwL5qQD7BG9dxl1XMngn
4Y1nHHlY7NpPNHvVYBQR+FkK9sJ5ngk=
=weZd
-----END PGP SIGNATURE-----

--5f4SvGdaKPbGqn2N--

--===============2500548729373118186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2500548729373118186==--
