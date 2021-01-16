Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ACF2F8DA5
	for <lists+uboot-stm32@lfdr.de>; Sat, 16 Jan 2021 17:21:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02D18C5718F;
	Sat, 16 Jan 2021 16:21:50 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B24EFC5717E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:21:48 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d15so2900366qtw.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 08:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3LtlmWXW97x9mwDsBVQtAk59q/JA3hnu8AHbiiiQrEU=;
 b=QB36hPx6Vg13lwJdokQQzoBKRdhVnz/zKjbxtlxnKUcot2HZ0I2WKznKAktxFQHhv1
 r1RBSJSmfe0+Dq/UvkXJvea2RM/3C+XRrislAHJ74SaeNZvx/Cnh8FpPOIPZWZV5bvwu
 K1c+3CHxA+iarVJx7oZHxo7ZC3JxAAdN4ep44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3LtlmWXW97x9mwDsBVQtAk59q/JA3hnu8AHbiiiQrEU=;
 b=IqMiUJWGAQWxmWbDLTzXqxgWtPtTKBpphH/IXxx3rcGHIKwfElgAXfD0wfjjhH4rYV
 nYDVjkUml6cSNx4S3pk0Kmgpu7v8IWPseAE+CGxQosgtKl9ebjDev+AFvO25pNKPwQNN
 xQpmVjmBFIYSwEVhP1OP/65sk7v7z0roX1k8J/zx/gZPNj9wsQHJSzt9ql+YG8v5sRWu
 cIFzK7r8jtFRlqwsA/684KsmHd75sNTmJNqDQyqCIAL8KuEXflN+MA1vqT+YBFjrxFo0
 zZBJkFTwE2+nkbXxox4YwkTc1ay2zsr5sSC8S79xX735mnCEuW47hwhmJoJjQSgQvjJT
 a5mw==
X-Gm-Message-State: AOAM53260Msc3XmeLAjeNa0sdlqN2vslrS0lJRH5lxiJngOomU9QhnGG
 LQdrc0o8J01sEYpuuGZNQXqj7Q==
X-Google-Smtp-Source: ABdhPJzQqvnnEfHM/SXd5JegE5rw7HAmsXIcNPrSEAYhZhvLMSeq54iC0EUDZnopBzX8MYPwdIM25Q==
X-Received: by 2002:ac8:70c1:: with SMTP id g1mr16502222qtp.108.1610814107741; 
 Sat, 16 Jan 2021 08:21:47 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-bc5a-f8b8-3605-e048.res6.spectrum.com.
 [2603:6081:7b42:3f4c:bc5a:f8b8:3605:e048])
 by smtp.gmail.com with ESMTPSA id c136sm7384136qkg.71.2021.01.16.08.21.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Jan 2021 08:21:47 -0800 (PST)
Date: Sat, 16 Jan 2021 11:21:45 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20210116162145.GN9782@bill-the-cat>
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127112000.v2.4.I01167328d604e359d69c0d241754caeec1f65ebe@changeid>
MIME-Version: 1.0
In-Reply-To: <20201127112000.v2.4.I01167328d604e359d69c0d241754caeec1f65ebe@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 4/9] log: use console puts to output
 trace before LOG init
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
Content-Type: multipart/mixed; boundary="===============5691838245371473433=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5691838245371473433==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="57SHPaztv6dlLu/a"
Content-Disposition: inline


--57SHPaztv6dlLu/a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 11:20:54AM +0100, Patrick Delaunay wrote:

> Use the console puts functions to output the traces before
> the log initialization (when CONFIG_LOG is not activated).
>=20
> This patch allows to display the first U-Boot traces
> (with macro debug) when CONFIG_DEBUG_UART is activated
> and not only drop them.
>=20
> For example for traces in board_f.c requested by the macro debug,
> when LOG_DEBUG is defined and CONFIG_LOG is activated.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--57SHPaztv6dlLu/a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmADEpgACgkQFHw5/5Y0
tyySJwwAsQVp/FB2smjAXZe8xXndKd2R2xfdosrxYIXwH8mPVlz8Ti0F1ysx8ody
tR8KiL259fsKW4D4hlR3LqG+YeJAqRxWOiPRz6p5hnhEAz6dcFsJeXz56ZbmuW63
BJu/EaHDvVsYokCtPP8fGISQNE5UUgSnWgivv7oZMeuZxo95GIR4duS6lxclcpX6
OGo2UT5fiQuqN9R1Ti2JpP+HmwBZV1FCsN0aU75+8uc7D1RVeLfBJIO7HjohUbBe
FMCnnsC/vOhef6goj7AcbfVZ6gs1yXmGj6U7Srd94mUzqatRaUc8i1GYXGzn2Orj
BM9xHzeTVtms7tTuWXc34cZP1Aw/HcTElifKbclKLYWDRcbulJgTPgCCa7eGvhLb
JDPivsd2+DTHZn22CmWA4x6Lbvxodb8/U5JZogxPp7dhzrJ+5j741G4kkLTGzPvs
Fy+Il7t+gkFZfx4+/svvypopRrSb3V/rkYFHSeT61vA4w0AI1u2SeLPRwt1PbEum
B13lJpxs
=NMXM
-----END PGP SIGNATURE-----

--57SHPaztv6dlLu/a--

--===============5691838245371473433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5691838245371473433==--
