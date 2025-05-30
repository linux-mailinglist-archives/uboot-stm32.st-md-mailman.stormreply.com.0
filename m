Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D16AC968C
	for <lists+uboot-stm32@lfdr.de>; Fri, 30 May 2025 22:27:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20ACDC3089D;
	Fri, 30 May 2025 20:27:47 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9D13C35E3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 May 2025 20:27:44 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-4064ec636a4so1371437b6e.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 May 2025 13:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1748636863; x=1749241663;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ms/iE/i7KA4vaRyMl4upJfBb/hL8E/MaIo32AWC7/EM=;
 b=AqWwFUs47fkdH4WfaYH/A93hSSKXZvaNOI4ozLfDnswR2A48PDhXVilj4p2yFtO0Zx
 ke0uLyLOyx+us6cUO9DOyymbtcEaSKi4TOtCCKPRSIqRihG8bNzhtTwt1DxRfDRCevYR
 cAn32JwZ3a7JwExlVeKwfHmjvVBbTQuEqTX/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748636863; x=1749241663;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ms/iE/i7KA4vaRyMl4upJfBb/hL8E/MaIo32AWC7/EM=;
 b=JS7y8M0OgZCahpOgO9nJpcm4PjXorfFbRQkaPDsENYgD8GGN1R1xaUXbMoHRxISFd7
 yauNvdFikHOLPUYTgz2r3YaftguPwXWrVfJVeJyWfcjMqRkOe6FfegdSAYZJ4/6yCuZB
 Wu3WlFPu9y2arZpyG5f2hqMFgYT5l1gAnkQFNIY7qWSQW1rSL2PvOaeZb+6eCr4UOFI7
 GL1ZVbX9IgbIP4ixheVayJJy6vqDLWdr1LJpWCQ+yEHgYxUeLH5IRUovY9IOaQcWwM3D
 gqhsbq0lFAE62WNsf6cN5nbyqqgHBO1yekgF3x1k80NkDSmAM7eNZRbOs//a1fOwl98G
 SgyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBt1YQ8cDvsKIYEFlpWUNzYuIt9nThDQ/PHYg1pqXMopEJ/EZ66kvIQ9kdOFsekYwscPuGq9DZ2YAyQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwtmA82267VgZ0PnoP8zx276DCL2PGH88SXu5FmzFL2AT89Wdfu
 xKb+ACFK56y7eQ2vRq83Gu73ukZWdJxFkDPGGr1VwJpXIQBxkIq+xK2GUF3PvWIDO6c=
X-Gm-Gg: ASbGncuMCIbDxXBc9HBhc/qoEG2NLTz0HgS2uywzx4CQ6x8RE/Q6SIt6MpV7zpErreY
 GU5x4dr42VyCyphkNCFmgQ5hp6dPCnnvDu1BfNttjkN9pVPDDU9y8hIjhXFEOR0RsXc8suWJvtA
 bDXMtottnrX9enx4rkUlPQxYW9qI2a00/b59otn+SLIVJ7atsbAyvNJd+3cdHcX/JLQzQI866wb
 xL7yLN9VTkCfzmcFBMOmzTvcJx7f2rqv2CjkkcOvhcFjUM9xi6TUUlnvnywQLVaHk7GhJ95TZoi
 GToOMMdtS5xKVj6XxmE3Z5Wwy9aAeoQr11FtYn4nPcqTjnjjveKWfmG/Lubt1zVp5t15kVvGlTO
 9mmKmY2FV/Ivlnh/5xzd7YNI=
X-Google-Smtp-Source: AGHT+IFDYydZ6swT8zXGnUVbTIKJXy8lRWAQlblIRki5gVpvdrQh/7LmufLZXbdeaODK4qiudwQmhw==
X-Received: by 2002:a05:6808:45ec:b0:3f6:a9d4:b7e4 with SMTP id
 5614622812f47-406796a0514mr2322600b6e.20.1748636863550; 
 Fri, 30 May 2025 13:27:43 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-42.totalplay.net.
 [189.203.100.42]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-60c14c427d2sm500945eaf.4.2025.05.30.13.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 13:27:42 -0700 (PDT)
Date: Fri, 30 May 2025 14:27:40 -0600
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20250530202740.GA4068177@bill-the-cat>
References: <20250523091140.149298-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250523091140.149298-1-patrick.delaunay@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: caleb.connolly@linaro.org, jerome.forissier@linaro.org,
 Casey Connolly <casey.connolly@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Adriano Cordova <adrianox@gmail.com>, Simon Glass <sjg@chromium.org>,
 ilias.apalodimas@linaro.org, u-boot@lists.denx.de,
 Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@arm.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/3] Restore support of short name for
 type UUID parameter
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
Content-Type: multipart/mixed; boundary="===============5235097258122051427=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5235097258122051427==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NNTvoToqVKPsylyD"
Content-Disposition: inline


--NNTvoToqVKPsylyD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 11:11:37AM +0200, Patrick Delaunay wrote:

> Fix and add documentation/tests for selection by string for known
> partition type GUID introduced by bcb41dcaefac ("uuid: add
> selection by string for known partition type GUID"):
>=20
> - split list_guid for short name (used also for partiton
>   description with type parameter) and full name to display
>   information
>=20
> - as the function are uuid_str_to_bin() / uuid_guid_get_str()
>   are no more under CONFIG_PARTITION_TYPE_GUID,  since commit
>   31ce367cd100 ("lib/uuid.c: change prototype of uuid_guid_get_str()")
>   and commit c1528f324c60 ("lib: compile uuid_guid_get_str if
>   CONFIG_LIB_UUID=3Dy") move the content of array under EFI_PARTITION
>   and linker will remove it is not used it (in SPL)
>=20
> - Add and fix documentation for gpt command
>=20
> - Add test test_gpt_write_part_type to test "type=3D" parameters
>=20
> This first patch solves an issue for the "system" shortcut for ESP,
> removed by commit d54e1004b8b1 ("lib/uuid.c: use unique name
> for PARTITION_SYSTEM_GUID") but used in 2 location (at least):
>=20
> 1- board/samsung/e850-96/e850-96.env:10:
>=20
> partitions=3Dname=3Desp,start=3D512K,size=3D128M,bootable,type=3Dsystem;
> partitions+=3Dname=3Drootfs,size=3D-,bootable,type=3Dlinux
>=20
> 2- arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c:1151
>=20
> 			case PART_ESP:
> 				/* EFI System Partition */
> 				type_str =3D "system"
> ....
> 			offset +=3D snprintf(buf + offset,
> 					   buflen - offset,
> 					   ",type=3D%s", type_str);

This leads to failure in CI:
https://source.denx.de/u-boot/u-boot/-/jobs/1151511

--=20
Tom

--NNTvoToqVKPsylyD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmg6FLgACgkQFHw5/5Y0
tywNFAwAs2pJFHKj+NteD9rb6bZ7wMmWMdloYrfoJFceOq9TFPrgiM/iw3dsAGDJ
qw1YY8CFYPI9TQNSCPOU85da4Z4WMAN6pTkQIWSaT6dxxBFs+hTopJpSdEJvhxJy
DRjfixlpzA0OYQNwMgd1AtCcyyNOxSrKXSJV6vyhAMP1NM9qahewh/onyPdGMTnf
Hz7N/iQtjXysxKvEhV+AunWrRoZc2fqqUVbt29Fj+/dnsTSkXG16LryT7Ff+Sulo
gVkMsaKycbX9MuIoFy/uv3y6RebLxhRs5wHuoa80Ox9utlKhLRhCMvcEJnSg9YLm
QA/JcUg+oYoW0yjS/dOt2wzeaaSbBt4QCHZbqj8dIBSGhC6JSUnqDDL9bv+T5CrN
bAiTCOUmsFEFVozogYZ/mnS+Bdf9EDUs/ijMXIKjOnxRKPabHCA5i2FD7Brx9UUf
8b0PswlouThzEc4f7VAH0XsEQAzg0frbiBguuU/NINfBi5mW1fTaIJByAR+6DhJi
h1wnAH75
=w7eT
-----END PGP SIGNATURE-----

--NNTvoToqVKPsylyD--

--===============5235097258122051427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5235097258122051427==--
