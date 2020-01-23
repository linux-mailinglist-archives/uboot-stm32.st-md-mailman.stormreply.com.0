Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C094D147377
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Jan 2020 22:58:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74C7CC36B0B
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Jan 2020 21:58:05 +0000 (UTC)
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2E57C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 21:58:02 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id 192so2364984ywy.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 13:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fRt9AJYDeYGWv6U83BS/AzpSO01nOGTTZEwhhewBvL0=;
 b=dLbxmM9Gilu06Y0/FgkgVSFqphofjNzIiK5zj3bnQvsSIKlwuRe7bDMPAgvvWSqtHs
 4eR8flCM5lhBBxEZZd/LbTBnviht192jipzI+iRBYtUjSfBAeBRYzJfHSKT+2tm6wxQC
 QsbBnWlG3N/1UOpzGmoYWKY2qNQKrvvj01qLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fRt9AJYDeYGWv6U83BS/AzpSO01nOGTTZEwhhewBvL0=;
 b=MMvltDqv0N6Tl4jkHZdoLF2jzyXieVKxcVdPYC0iVoFJ4K4mtL/+8Rpv3CXdmJyJJV
 uJC22uKRMp95nT+y8/YcTQNlq1+w8ofH7pi4KtyLjrE2Wr+yJoxHnR+TkwkymD4Ner6X
 HZ2rGEHgPT24I83JUbmC/EIxMTz0RwjXjXUgtfcIdvRj0JwtAnf3TJr5aZQhGwxsn6ah
 OQJ6rb2+Fj1uEcb3J8tQjgsVuT1zF7hMq5eVBfZfxAf4kqi2WsVO+/P+PJh0RwRj89Ht
 3Bp2nqXIbqilVyV3u56+glAAWzwRJXGWRRtwNc8TfOMWVlVmTqjPFqg8SFvyZyFLMBYD
 uH4Q==
X-Gm-Message-State: APjAAAUiQzG+N3dnH30K8BmCXTNInc9+0mv2cAyGbdX0i8htQ5X9iVFq
 H+EZA9sKjImraWDoIPQt5kKcGQ==
X-Google-Smtp-Source: APXvYqzh/DjHFoOvc6hYgDwiebTw/GrsFNDYgRrIJDWbFc91cfZ0LLS/Hb0Xmka3YgLi5HdPE7QVUw==
X-Received: by 2002:a81:204:: with SMTP id 4mr6803905ywc.224.1579816681432;
 Thu, 23 Jan 2020 13:58:01 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-4d1b-b279-03ac-0199.inf6.spectrum.com.
 [2606:a000:1401:86dd:4d1b:b279:3ac:199])
 by smtp.gmail.com with ESMTPSA id u185sm1350933ywf.89.2020.01.23.13.58.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Jan 2020 13:58:00 -0800 (PST)
Date: Thu, 23 Jan 2020 16:57:58 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200123215758.GE26536@bill-the-cat>
References: <20191203083835.6898-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20191203083835.6898-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] cmd: pxe: execute the cls
 command only when supported
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
Content-Type: multipart/mixed; boundary="===============3518774704352618163=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3518774704352618163==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7QsOHKuLbhbLTwLB"
Content-Disposition: inline


--7QsOHKuLbhbLTwLB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2019 at 09:38:35AM +0100, Patrick Delaunay wrote:

> Execute the command cls (for clear screen), when the "menu background"
> keyword is present in extlinux.conf file, only if the command is supporte=
d.
>=20
> This patch avoid the warning "Unknown command 'cls'"
> with "menu background" in extlinux.conf when CONFIG_CMD_BMP is activated
> and CONFIG_CMD_CLS not activated (default for CONFIG_DM_VIDEO).
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--7QsOHKuLbhbLTwLB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4qFuYACgkQh/n2NdMd
dlKuIQ//RBOAR1QzTcu3E7DlX0L1UP5Ha0ZYzW2eKaBgsAMdbFi0hJnvOsjPcwgE
O5flKIOvb2bzn/eY6lL+zen6mMFuHKbpaVnUd8tEvTVhPIvrSW48wrS/JV6Jmavb
O8O/3Fr4Yj6KOqQzbrSXueuzbapdXZrNvOra1N85GF8Psk6YsmBoSIRRP5Cdcudu
y0EPpZVMF+UTHwZBbdyuMw63Xr+uHnxs6jfpYkQ7u/2hIWJSWapLPC5b7HMGHtvG
qhoOi0+J2OJdnTmyC8yJuRSjulZhvBr7qriTk759IqFWvo+0f2IoDssihltHKgWt
W+TNLbRLiSC3MbJHRXNqfebCscVCsqUSjDUeu/C+6nltSIJF81oBCddVTlAngW1y
58zyCFHIKT73N52OxASAkxX2MeMYCuSueqK5Gyk1jktMHT4xxKUuFmesDbMAJib/
SEYpwt+JZ0M5pwgf35X+/GfR2EBjt5WixpCc9tJ2GWZnCadHN6r3lW36nVV+T1UH
e0d9lwgs+sKn9V6u7C8bjvk25fPkGYE57vvUTknwJG3bBpRBB+R42H23DM2pj9ny
GKv8WbU65GXVZD6i6hdqm73w++6RHc0byYWS7l4WzwE6BPAkbv3Kg4IPOhDBeWW3
qxJIyHJiDtNwpZ+OGyzkrfhqiY/72/PffFKhKU319x2Ra9x2UqM=
=aQgl
-----END PGP SIGNATURE-----

--7QsOHKuLbhbLTwLB--

--===============3518774704352618163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3518774704352618163==--
