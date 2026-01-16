Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 402B8D385D3
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jan 2026 20:28:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAB09C8F28E;
	Fri, 16 Jan 2026 19:28:48 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDCABC5A4C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 19:28:46 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-45c798c92edso1477457b6e.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 11:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1768591725; x=1769196525;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jEgvs/moihqaoOErxv3ruyIOqtTzZ8swcEEBj+kboIQ=;
 b=pHBq5ZqYZcaZuCs4oIyLxZdPgwwvokDSQMHb925UcjdKzYeP1csN39itG9PCIp8yl3
 +zIv99wBis24H63HKCVdWtT+za2SKnC/4sE8yf3mcHBU8jPb+eMhA3sOnYANF5MyNH00
 D0qJQNNHPnONybSXE+G/+pKnPh2sDeBH02MhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768591725; x=1769196525;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEgvs/moihqaoOErxv3ruyIOqtTzZ8swcEEBj+kboIQ=;
 b=Pl13S2kibGtG+LFK1N59M/ZiR6FolR5Zov0Mns6bqEEGxtH0eq/P00JAKPahT2G1/y
 gQqwz4d2vH9Dv9ViKnHnfewJgS4ftw2pHfUe4lgk9Ww9xRiwffGiN29sPC7drT5R7DoW
 Jz38CzM3TdpdKaDi0/0EZWNzq+7sPZvG3nRvWBXgPNYT1/Q3QEG8Io4Cwdczmjup3UH7
 rh9KojHL+rwXel3MesSX1bCOCa3hKZQmgqaCyyDCsuiIA2eWflQjyB6sYpryZV3SZo5h
 4iaA1/sBz2WbanKnF0dz37Bzm5srUfbZUA8zPqocSvNP41J60vLCU6wxRMrB7bdJwRQn
 ptjA==
X-Gm-Message-State: AOJu0YwZ9oEMYyvzD9VCYKurdPDR4Vqknw9pty3f/jTlJfgIodXHUVrb
 y1u+5JABDH7/8tOUlCkdS2NKmsV2BoK1UGo5k6jtV2STaMSpzBS9OHfpteLbXgjjtHU=
X-Gm-Gg: AY/fxX5ob/m19LHpPhl8WMQm8a1HF/v3oniQXGoq64oGyBYWDSvkkkhHvtiTtKnv7Ig
 1gm83F7Dr4El1AXp1OAVS3kUo6WVWNd4VOE/R7UloCZ/BDhFpD+mEsvBc2syneHUI+LJAv960ed
 JQCsr/NxH8Ual1ggHAR0tRsp6AIwyrltZ3gk6CxtHfqV91IkeAKOVUTr/cHk7GtOV6kl0mEhA1Q
 E9uuBHVXybpa9i8abaFcKy8YHaMVAdgTf6JkSfHgsEC1dykrJjnBz6AgG70BdKh1vkpbIyfb0aF
 vfKUxnONYMya2o26M3m9aRWy7hr/CjCB5AX6mQ3RJj4fcKSJQsAdorFp13M1I9aNZJsW2M47+2R
 dwrZ61szzR+pJxIhi66+AlR1uABCqtZ4a2mC3Gp+UOZVS52hzwLF0rvsv9xlrLz6gGG0YIrKB/7
 jjtSX8Nx4hOscVHn1iG3QJg68MfpQ/wYrRBn5fg6KJxr/SqN5QlHM/Wdyqf2OvQ2CtGcHGNxv8Y
 aZw4om8xv0w/HZjcIfj2hPNRImrLWP60xwvo48=
X-Received: by 2002:a05:6808:150e:b0:450:3c7b:e7d0 with SMTP id
 5614622812f47-45c9c0c23f5mr1633297b6e.48.1768591720729; 
 Fri, 16 Jan 2026 11:28:40 -0800 (PST)
Received: from bill-the-cat (fixed-189-203-103-235.totalplay.net.
 [189.203.103.235]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-45c9dff95a2sm1731483b6e.11.2026.01.16.11.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 11:28:40 -0800 (PST)
Date: Fri, 16 Jan 2026 13:28:37 -0600
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20260116192837.GO3416603@bill-the-cat>
References: <20260116-add_bootph_all_for_ltdc-v1-1-de4dc0ae1115@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20260116-add_bootph_all_for_ltdc-v1-1-de4dc0ae1115@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Add bootph-all in ltdc
 node in stm32mp257f-ev1-u-boot
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
Content-Type: multipart/mixed; boundary="===============1647570770569933734=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1647570770569933734==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EsYNrY+v/FG556Bi"
Content-Disposition: inline


--EsYNrY+v/FG556Bi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 08:12:06PM +0100, Patrice Chotard wrote:

> Add bootph-all property in ltdc node in stm32mp257f-ev1-u-boot.dtsi
> to fix the following issue :
>=20
> Video device 'display-controller@48010000' cannot allocate frame buffer
> memory - ensure the device is set up beforen
> stm32_rifsc bus@42080000: display-controller@48010000 failed to bind on
> bus (-28)
> stm32_rifsc bus@42080000: Some child failed to bind (-28)
> initcall_run_r(): initcall initr_dm() failed
> ERROR ### Please RESET the board ###
>=20
> Fixes: 29ab19c2bead ("Subtree merge tag 'v6.18-dts' of dts repo [1] into =
dts/upstream")
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi b/arch/arm/dts/stm3=
2mp257f-ev1-u-boot.dtsi
> index b70cd8b52ce..c3c9c94f165 100644
> --- a/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi
> @@ -52,6 +52,10 @@
>  	};
>  };
> =20
> +&ltdc {
> +	bootph-all;
> +};
> +
>  &usart2 {
>  	bootph-all;
>  };
>=20

Are you upstreaming these? Thanks.

--=20
Tom

--EsYNrY+v/FG556Bi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaWqRYgAKCRAr4qD1Cr/k
CvLwAP0V23ghorscORmR2MndF5n4juoLhCniHNJd2HHS3ECovgEA5FQfQqfyX0WA
PeYCZ1k1G5oqLmSr+nu6w4FCPKtcWAY=
=5awd
-----END PGP SIGNATURE-----

--EsYNrY+v/FG556Bi--

--===============1647570770569933734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1647570770569933734==--
