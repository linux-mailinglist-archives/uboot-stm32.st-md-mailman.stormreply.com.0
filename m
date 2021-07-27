Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3273D79F7
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Jul 2021 17:39:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70CE4C58D5D;
	Tue, 27 Jul 2021 15:39:17 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32046C5719C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jul 2021 15:39:16 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d9so9760659qty.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jul 2021 08:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+EtNc7WvvKfZRP0wXMIzAqYduCEo8TifOMvfkJLPOEI=;
 b=fNygcbwbYmhypNxls98eXNJaV39HTGd75vWzi0y0A0/nDPqtTP1648CHSeLIQOwVFH
 Alr4afu75gV5e73+w8BslWADlR2Kd1o4xuir5VEiHqYTxj1m4VwisEYhEEfo45HHOrP1
 U/xh2njvdSBOSXUEysHTPntYlzEr97e8m1ifQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+EtNc7WvvKfZRP0wXMIzAqYduCEo8TifOMvfkJLPOEI=;
 b=hits25tShNKEngMGEXXFINSIZzssHi6XO8vDO8KnZ4fAzhHxl6lnOXOQ6rxxDrD/J7
 JczUfp5E14YrWAzc6oZYOqvXfQAIevUztjbzgK6ifSFjciCx1d8z4FjRcg1cOydVtQ0j
 VaabEA03DH8E9GARAcQMUCCJPwu6AaOKiT2b9BiaMJR3synAHBxs4/paX6rOw5+ZIwDv
 PxZujVy9mqfWMezCT9vXis/QjRKgyMS3y1c61p3JP9b2Py3zJvovtlsi2DesLaxc1pVP
 nwChR/aG4jkwxYaYPF0bt8ZDJ9j6tuWAZPg2CIH1EgEPz+P/HwGLCSezABrDSwdV4JX8
 hWzg==
X-Gm-Message-State: AOAM530EH7scc/sulxtbyluqMSdvqlbWOhjkutGOpmgWiy6cR6fS8dhZ
 pKpczVYE6L+JgsjNkv/jie1Kxg==
X-Google-Smtp-Source: ABdhPJyeV92Ylg8fc16fcAPjt1YkgGWLB+5WgyvvMBEV/2lTF7aud89aOxpICKZbg4mWBzuw/7HwKQ==
X-Received: by 2002:ac8:7954:: with SMTP id r20mr19629510qtt.342.1627400355037; 
 Tue, 27 Jul 2021 08:39:15 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-f53f-8332-072c-4f35.res6.spectrum.com.
 [2603:6081:7b01:cbda:f53f:8332:72c:4f35])
 by smtp.gmail.com with ESMTPSA id j7sm1449103qtx.39.2021.07.27.08.39.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 27 Jul 2021 08:39:14 -0700 (PDT)
Date: Tue, 27 Jul 2021 11:39:12 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20210727153912.GH9379@bill-the-cat>
References: <66d4e139-567f-c219-0f54-46ab5487d419@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <66d4e139-567f-c219-0f54-46ab5487d419@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.10
 = u-boot-stm32-20210727
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
Content-Type: multipart/mixed; boundary="===============2370038893091768730=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2370038893091768730==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J4B64LE3ZzGsLqoW"
Content-Disposition: inline


--J4B64LE3ZzGsLqoW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 11:22:31AM +0200, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related patches for u-boot/master, v2021.10:
> u-boot-stm32-20210727
>=20
> - FIP Enable OP-TEE and TZC support in SPL for STM32MP15 SoC
> - Add stm32mp15 missing SPI clock support
> - Manage pull-up on gpio button STM32MP15 boards
> - Correct STM32MP15 boot when TAMPER registers are invalid
> - Fix EMMC pinmux on STM32MP15 Avenger96 board
>=20
> CI status:
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/8434
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master
> https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> u-boot-stm32-20210727
>=20
>=20
> The following changes since commit b70b9b07463db2f6937c7ea6d7fb5122feb7ba=
1b:
>=20
> =A0 Prepare v2021.10-rc1 (2021-07-26 20:57:18 -0400)
>=20
> are available in the Git repository at:
>=20
> =A0 https://source.denx.de/u-boot/custodians/u-boot-stm.git/
> tags/u-boot-stm32-20210727
>=20
> for you to fetch changes up to 65b3f56d42e5ddc9183843723cf735950f062410:
>=20
> =A0 ARM: dts: stm32mp: Add OP-TEE reserved memory to SPL dtb (2021-07-27
> 09:48:11 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--J4B64LE3ZzGsLqoW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmEAKJUACgkQFHw5/5Y0
tywR4Av+MRNgzlfvu/d5D188Mnnaic1/4poWajfjbXEpJfbVBctN0lxZxjns45Vp
POw3XqnI4cxltZ7Zx9TSaLV1iPOMdbHa8X5pStpLUFOnTNXeBgfDWtL7EelJ2VBK
YG/TFiVlCNWUSeF8jSZwn6fpTG+cjInGUcwwd+FhEBj0gXlGB13cXpDbZJ1Kbug8
O85AoYE+/tuy9tsJgf7JfBzOL5X7FcdL83eXNaxF2RlS3Z3hYYtGxesugKF+52tL
zyMN2jfM+ckftlJ21cnOWC/4JPn0w/YD9D1UCC5y3vIEmxLsiOvp/Q7S9kahZ8El
HxFKGyLuqg3sY2C28nejaEjSI8KRtufTxPqNxNZJGeDG83Hf4n4nSD4VU5AvSJ91
UHM1WiDV36k8EUte5ZZVN/cbKtShWH3zsRA7WG6z0VCxxfrTO3rEEMa3K+hsurXP
TGSX2/rf9JsER9spOcDlJV/v3yBdKaCoWgWUsTMqd5dPP4Be+P9u9CDIuZ1KuNyc
HeF8n/i9
=6Dq2
-----END PGP SIGNATURE-----

--J4B64LE3ZzGsLqoW--

--===============2370038893091768730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2370038893091768730==--
