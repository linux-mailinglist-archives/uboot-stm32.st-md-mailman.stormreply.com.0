Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4433422ED73
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 15:33:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DF09C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 13:33:52 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81E1FC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 13:33:50 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id m9so7417694qvx.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 06:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Inne5q3fJbBkTfe2FDLerxm7xqBYnrfVx4mYmoeg3jg=;
 b=f9JDGOKxadF3SJ2YqfaXseY5/kA3hoReEhrHbTedqr+I/JuL45/aW59oNrU1FNZ5I4
 WPVn5cDW/cFWIn+/pwg8qlSaSW1eeaD7D6BHq58nDiOBZ4enN5HIzdhixgO5KlsiJvkA
 ZvjrWHOHXImjeTtcisMLPcPnKmtkfcSUxyGkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Inne5q3fJbBkTfe2FDLerxm7xqBYnrfVx4mYmoeg3jg=;
 b=gFlXiKo1wJtMBE8by0TmXoEtfiTEahHgnahhGdYHZTljNvJqSQbyejYCHKnOx0OoBe
 2pl/EWJ0WK0IIgqNVnKThqkFS/YGpKP3eQBs5SICJAmoCxvvvnXCby5CT/zMiQBTxNwb
 V1nG4aykH8Djk3DRwO5zpUfPePMclHGMXDVfUtKrrtAkeFoN7id7JIWoiH7kT+OOPw3v
 c2BwbM8vrBdIuPQx5ew7yK4MLnJ7ZDZolDj3AC6hoKGCf8MplJMf6/tuR9L+/bto7SVE
 eAQQezsVclF50uMKxF1YgwSWnYuv/0BbM6LtNpoLX028SfOGZz2BxsxUhCq3pnmr6xMe
 zuTA==
X-Gm-Message-State: AOAM532zTTj2NwaPGPtVdw4XvJjV2uEqoaI8cxwxgo1zwpJ1wL1yfgp4
 v0ZY0koI97psnYBaH+9KOTAmAg==
X-Google-Smtp-Source: ABdhPJxl57SHMqksTOl8CLPQp7dr3KJHMJof0WBnJRHauyMT8D+sFSjGp09cpudXVobnIS/NKhUs6Q==
X-Received: by 2002:a0c:9b94:: with SMTP id o20mr23138671qve.177.1595856829430; 
 Mon, 27 Jul 2020 06:33:49 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-f1b9-a518-346f-c376.inf6.spectrum.com.
 [2606:a000:1401:8c61:f1b9:a518:346f:c376])
 by smtp.gmail.com with ESMTPSA id 103sm9266181qta.31.2020.07.27.06.33.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 06:33:48 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:33:46 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200727133346.GM6965@bill-the-cat>
References: <20200619120337.17042-1-patrick.delaunay@st.com>
 <20200619120337.17042-5-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200619120337.17042-5-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH v5 4/4] test: env: add test for env
 info sub-command
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
Content-Type: multipart/mixed; boundary="===============8641311292575037269=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8641311292575037269==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dfmC41YZQlborXoK"
Content-Disposition: inline


--dfmC41YZQlborXoK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 02:03:37PM +0200, Patrick Delaunay wrote:

> Add a pytest for testing the env info sub-command:
>=20
> test_env_info: test command with several option that
> can be executed on real hardware device without assumption
>=20
> test_env_info_sandbox: test the result on sandbox
> with a known ENV configuration: ready & default & persistent
>=20
> The quiet option '-q' is used for support in shell test;
> for example:
>   if env info -p -d -q; then env save; fi
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Acked-by: Stephen Warren <swarren@nvidia.com>

Applied to u-boot/master, thanks!

--=20
Tom

--dfmC41YZQlborXoK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8e17oACgkQFHw5/5Y0
tyz/MQv+N5BLR3jaoLByTSme8xjY8OxWd9lG48l7ct8V3fSa8O2VL6tJy7lO8Iuh
5EDFlEoBsYK2002NDffQVAuTXJcn/AlvtKsFt7G7pwYaumXD4STOfdWKx9/gexWU
P0bt3xfI4ehk7xaqhlf/+z5uFtxScTid0kxhSllTWo/V3Bzo+JHIwN97t/gQS/Gz
0d/Dq1Bzfq2t+CfGVdCtaTZ1Vyt86FA+PpZL4eq9FQVrIlMxpgQRcYDr5cCTFk/v
QnclR8fzGTANGd75A/aiPi9IsEBW9zJUf6h5UuyA6UcS+quW/T2Tk1dth7E7fEkY
4yJEUkQL39niaMw1WE6tGoqFzzLUmETBanw0xh3zERUYFGBE1LXW8wzY9n6KjhaH
87sXOm6RBVUG3D9Gv6ntMiAcSohMGyVmJlBmPdEpreAabCgQCuKYNHxyDJmyfopu
0KSlVtGS2DcxVpLZB25dZ6iVhR5mqNT8WPGu+YpHSzNN3bOO7KhBz207hBPeUWxK
0HD+ClV6
=Q0Fv
-----END PGP SIGNATURE-----

--dfmC41YZQlborXoK--

--===============8641311292575037269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8641311292575037269==--
