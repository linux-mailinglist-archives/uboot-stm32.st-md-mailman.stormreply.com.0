Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D47C2EBDEB
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Jan 2021 13:57:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09AFCC56634;
	Wed,  6 Jan 2021 12:57:02 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF7F8C3FAD6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jan 2021 12:56:59 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id b10so1047672ilr.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Jan 2021 04:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xT1x9Nf4bHZ1L9ak8zDW8FK2lA0T/EPOdiT/JhHHZbQ=;
 b=kC++r1Z3ejKB7G6DMpk5DDdT2IQbE/gt9rG+7KxEygh32aB1hIUCdVzAHPQXOo3z6X
 zvdfFVZ7n7Nk4nA4R2aYHavvX+rZLlc+JP7YsIs8Lwa1bhDb6C6qbeTdX5PDo/DJ2auw
 tQlkm3bAgxfWxf/Oo3UjUm70FN38OzDkbB4RU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xT1x9Nf4bHZ1L9ak8zDW8FK2lA0T/EPOdiT/JhHHZbQ=;
 b=jE+iyzBOvhq8voa7fuMacN8C3EwziA5ND/1m1EjXMx5o1UmSA/7SH30GOGEELW3XyD
 /Hr2h8SHT9xzquhRVEmb9ewCdWjCdnHFH1415nCEazO2LRHAStPG+aa6FK3R1tCo8qP7
 ToKpw2NC5VvYMBiPl9CbTfP3DwyJpyzq99i01LwTRDgAeanAfCBwX79Xk3dpCf3jay/4
 NJmhky/a73wHVjbZWTLnuxc/lX4WwQAZt63jdRsTcKEpyXoayUvur4v5fukM0gdlFSIR
 rVMpFaxIAl/58W/Vk9fmGAfio4rxaY/EZBK8uyFps3o/ghu8timEogPVGp/IdrQPASqx
 /ooA==
X-Gm-Message-State: AOAM533kUEl92LTgAqCFTDvCYFsdNqoeRfrnfrCEACDfaFZCsv3WNtNP
 D/yPTjVQerU59waQAyO/l8M46Q==
X-Google-Smtp-Source: ABdhPJz5obzatOiWf0zaNqt0lM83e9AYp45RqemDUUYkgqm/TZ5bqkxPcW4dTiNj/xzIaRnnykYjnw==
X-Received: by 2002:a05:6e02:1bcc:: with SMTP id
 x12mr2122905ilv.28.1609937818706; 
 Wed, 06 Jan 2021 04:56:58 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b42-3f4c-54e3-fb4c-b632-751c.res6.spectrum.com.
 [2603:6081:7b42:3f4c:54e3:fb4c:b632:751c])
 by smtp.gmail.com with ESMTPSA id o62sm1386791iof.5.2021.01.06.04.56.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Jan 2021 04:56:58 -0800 (PST)
Date: Wed, 6 Jan 2021 07:56:55 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20210106125655.GP2292@bill-the-cat>
References: <e362403d-b543-cd5c-1edb-41aa3afba728@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <e362403d-b543-cd5c-1edb-41aa3afba728@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.01
 = u-boot-stm32-20210106
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
Content-Type: multipart/mixed; boundary="===============1117220187682590608=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1117220187682590608==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZmZU9S7l/XJx5q9b"
Content-Disposition: inline


--ZmZU9S7l/XJx5q9b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 01:12:26PM +0100, Patrick DELAUNAY wrote:

>=20
> Hi Tom,
>=20
> Please pull the latest STM32 related patches for u-boot/master, v2021.01:
> u-boot-stm32-20210106
>=20
> - Fix GPIO hog flags on DHCOM boards
>=20
> CI status:
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/5764
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> u-boot-stm32-20210106
>=20
> The following changes since commit 62b07b5173e3d04fabfac42cf1f4779d021f94=
ad:
>=20
> =A0 Prepare v2021.01-rc5 (2021-01-05 07:30:39 -0500)
>=20
> are available in the Git repository at:
>=20
> =A0 https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> tags/u-boot-stm32-20210106
>=20
> for you to fetch changes up to ec4efd5ae724c51cf40437fa4c6bd758d3816bcd:
>=20
> =A0 ARM: dts: stm32: Fix GPIO hog flags on DHCOM DRC02 (2021-01-06 11:01:=
31
> +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--ZmZU9S7l/XJx5q9b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl/1s5cACgkQFHw5/5Y0
tyxYDQv/ZxsDGBuDtM4kgJrXcHqLDppYh+O5FExUPCzC1Ak556wCxKjgvh5ZP/tJ
YOHYzXIuT5httWp/feOV5sT+tmsl02CA+PoEzqm2OhFVCbgLv9vDw7OInFLszPvq
aj3OYQdF9rm1u32fZ81FSpO1eX7nqGYDlxTqbBRNaUrVQYYRDHlo4rBtfGKRW91+
3dJ1nynR5Yrjm5u85OlclnhxB2Ifm0ZIZIlaVgwJ8XkGymr9iNtiYM6c7UBE8b4J
TlXjTht/RTP+f40bRaw6K5evSY1T0Q7EITlUx1cFLyIm8gsXeyUWYWwUPwHJkUAd
dG4dtuMhzCeXVpPq6sXoOec+mEFVMUU9yNBnBvOqLnLaBChbpWhRcSPQ3eBSZT36
Pvase8QnkbVefmXHspuqDC9kfF6Y/XeZYaAxjWTgpmnevcPaKg/HUqaK353v119F
7Mzh6lFfU+yowMYNZzkPivvETu84fRf6jgvUewV5SZpdaooOO4CsOcwEarYURSGL
1VS4dsca
=Uj1b
-----END PGP SIGNATURE-----

--ZmZU9S7l/XJx5q9b--

--===============1117220187682590608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1117220187682590608==--
