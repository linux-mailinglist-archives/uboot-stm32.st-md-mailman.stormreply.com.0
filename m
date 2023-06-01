Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1C871F060
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jun 2023 19:11:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9F01C6A61D;
	Thu,  1 Jun 2023 17:11:41 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29EB5C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jun 2023 17:11:41 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-565f1145dc8so11511237b3.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Jun 2023 10:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1685639500; x=1688231500;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XcJnMsvXn+WGJWE+7LVwkx8gvu4mUK2trvf+tEjDTgs=;
 b=FgSxxpwujboXaedyDcByyW71b2oTG4Yxk11i+Qmss+Ryw0yODhoLyrSTdSFKnLQieJ
 7+O7x1+No0S6vvq3PnXAF0A6dPMsZkF2rHboI5nSBdbooNojTfFSZ0HlQWcMFxFbot/C
 F5Fihr1KGh/c5GLv2CJD9ZXMKcL1S+bvEMd6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685639500; x=1688231500;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XcJnMsvXn+WGJWE+7LVwkx8gvu4mUK2trvf+tEjDTgs=;
 b=hlNhBH7kvM5OF2hKjjBqd8rFTQB+6gnBFCKXB52a6FDkhxAQCJJLBrfwHg/B/NHUtc
 BXa0OsDICZ4VB3uS56xFiCvkivhNTn62oXb/3w1pEtwQJN4Gt0c31nvOrYfQOhN/sPhL
 PynCuxH6QM4zcca6VYqaCOAlzaPeC573g2XgG10m7p0V/j4Juvowgp4HAF8HZqYpdwjZ
 nt0ukhsrohnz9NNYA/d9nzfdGMxhQcs3eXti5+GJp6CTZzqbMAU10cadxXkOPYMo/5q9
 zDghvNqvErK8aLOYY1j+QDGChiXNgzifUC1ZlptVeOTkmILMrLsPVu6WwT3qKcmtg1tR
 T7uw==
X-Gm-Message-State: AC+VfDxU7nnwF+BhAk3eDVnznCYkVsjDEMBNgifzABHAaCEGdFY3VvLB
 hEXHNZuRysR1N9gYkJ9Kk2Q9pw==
X-Google-Smtp-Source: ACHHUZ4KkK5nBGiQWhDSle0jDP2z+g2ndfqjFCVgw4Akdbqoc/eex2nw9frYkqg6+KkEeaCf4M/PMQ==
X-Received: by 2002:a81:d250:0:b0:552:96e0:ccd0 with SMTP id
 m16-20020a81d250000000b0055296e0ccd0mr11837734ywl.16.1685639499762; 
 Thu, 01 Jun 2023 10:11:39 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-94b3-8a65-fec1-4b24.res6.spectrum.com.
 [2603:6081:7b00:6400:94b3:8a65:fec1:4b24])
 by smtp.gmail.com with ESMTPSA id
 m67-20020a817146000000b00565374c5962sm3806728ywc.98.2023.06.01.10.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 10:11:39 -0700 (PDT)
Date: Thu, 1 Jun 2023 13:11:37 -0400
From: Tom Rini <trini@konsulko.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230601171137.GY3755309@bill-the-cat>
References: <20230601170602.2845768-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
In-Reply-To: <20230601170602.2845768-1-dario.binacchi@amarulasolutions.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: fix display pinmux for
	stm32f746-disco
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
Content-Type: multipart/mixed; boundary="===============4446177749336405635=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4446177749336405635==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="69KeE9+K4fWrCUU3"
Content-Disposition: inline


--69KeE9+K4fWrCUU3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 07:06:02PM +0200, Dario Binacchi wrote:
> As reported by the datasheet (DocID027590 Rev 4) for PG12:
> - AF9  -> LCD_B4
> - AF14 -> LCD_B1
>=20
> So replace AF14 with AF9 for PG12 in the dts.
>=20
> Fixes: fe63d3cfb77ef ("ARM: dts: stm32: Sync DT with v4.20 kernel for stm=
32f7")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>=20
> ---
>=20
>  arch/arm/dts/stm32f746-disco-u-boot.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/dts/stm32f746-disco-u-boot.dtsi b/arch/arm/dts/stm3=
2f746-disco-u-boot.dtsi
> index 19b5451db441..522cffb1ac9f 100644
> --- a/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> +++ b/arch/arm/dts/stm32f746-disco-u-boot.dtsi
> @@ -169,7 +169,7 @@
>  	ltdc_pins: ltdc@0 {
>  		pins {
>  			pinmux =3D <STM32_PINMUX('E', 4, AF14)>, /* B0 */
> -				 <STM32_PINMUX('G',12, AF14)>, /* B4 */
> +				 <STM32_PINMUX('G',12, AF9)>,  /* B4 */
>  				 <STM32_PINMUX('I', 9, AF14)>, /* VSYNC */
>  				 <STM32_PINMUX('I',10, AF14)>, /* HSYNC */
>  				 <STM32_PINMUX('I',14, AF14)>, /* CLK */

Why is this whole stanza in a -u-boot.dtsi file and not an upstream
file?

--=20
Tom

--69KeE9+K4fWrCUU3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmR40UkACgkQFHw5/5Y0
tyw5BwwAhja8DOouGhALzl3TfQUCStv1WyrTeRrqxnxVQX4u8w8iGlPhW6C19IvA
/oNwW69hBDPkThsn5xtVLZopLZUSqf+X6PIG40WlbQkEeY3Xudf5zZuvgdAxl8zw
cc1dN5lB4CqbyA8FefGhgtdwCZHOHbOhA3Xs8SL6EB8ZK3gEuD6Nx7mWnkiFiK/1
5z3dbIholHJo/j0/7DaWlF73+n6uPOExRQKp9cySjN6BZVFhV5BPLOpUDV0FPC2K
hbaKjPVKRViVSnonwmywzviW/NfH2OCpfR8HM3Z5PeSiSjLS1rnxmj78yxU5yHHI
b+nnkyYt3cZXTNe2ranuId2yoj5q6TmG+Zq/DI6jsfY8qxTaw7Qh/YG6WFQizYSq
pWLiWqDZruLTcA+es5UQkB4WCYu97JJvEclAtJA/gP4qUPEzaxzLAIMpc8/41iPW
LHAO60LRI5LTSjm7ht1SKpBhTuTAzIoneCyM+rcWiljx0/6TmO6zTeitidbUD8yh
Z/VvDYTw
=Wf4T
-----END PGP SIGNATURE-----

--69KeE9+K4fWrCUU3--

--===============4446177749336405635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4446177749336405635==--
