Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E79CAD7979
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jun 2025 19:59:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFCD2C32E8E;
	Thu, 12 Jun 2025 17:58:42 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CCFEC36B29
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 17:58:41 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-40905ae04e4so428773b6e.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 10:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1749751120; x=1750355920;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B/F5L9/wcaZCkC2sjYVWXckq05BCQIl4kmtiFVJjLVI=;
 b=NlT6P/mEp1d97T4Ej5YHJqK99epgDn/JlFyEmm/wRlLI2nOQi9bENlW6DXLRBGEZ8Z
 yUoWaaU48u1A4E639jfeNucPk3L2XR0O8nf+xmMpCXPQIOC6Jf9i9LtPUu61IFH7CwJn
 Q3PwuCWrqPdW1h/+bA+J+tRdVtZYsw7RdapHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749751120; x=1750355920;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/F5L9/wcaZCkC2sjYVWXckq05BCQIl4kmtiFVJjLVI=;
 b=Rh94s4NScBf1JRIhA+rOyuRg5TUe0+8STPg44WNyOq1axfgXpluy2ROqOle901W5Ap
 /Zti+ZoOPMZkVLxNauSfZ773+HtlxV8mOWnGb2Aze9PN/unP22j0PIfUQMQDjrCZ6ApJ
 WD4AgtEQK5pGnII74iAUHLretGM/XZUWVuhDBqE4iEv+jA1DZQPVI43qn0do8XeEk3RO
 574DTeIFHaYXpcLDVziwbMIpDuiE4uPrcXBV4/T5eN4vsOvM8exqF/LQXIlNujCytZ0v
 WzZKN0PuwCXxk6OVNj+ATNrUrBI8UOvc+8x+RdT0KmXF4rn3wPxxYGtzWae5esl4zVSf
 oapQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDSN6s+OdwAsC1byqzGIUZmZgkt1csmB3Ygccz3InvSvSpBBsz1HQhxu/uRNDFyBqVD+lDHvdzYLMcWA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzruxufCIP7a4tcJDAQkyKZSEUOQVT3KuCoPega0gmX/UOd5rSa
 e1ToHVgf8dLj3JoM9erW2OS7z0hvoPHUWeWraYUVDBRsEfiZzHCBFuI2fONJZGKPpS4=
X-Gm-Gg: ASbGncuZ9fgyhlwY9dZ/lEL+EnmtKfWcrjrYP6mMJkTVyKeBSUyf83g2pqT24B21rq2
 51mM1vhvZX3OfwNaUb48ierV3bJ+V/zYp4nd3f2GbGFHcdXWJADXa3/JOdFpdFhMk5EXyQLP+Uk
 faGKRIayoCIP7N2oGoWt8V9yE4upE4mDHlBHipTrb7zAD31tn2qoFwq+mxk/iVOybDlyvSBtcdu
 pHAr6XmNWnkm5txehqoPijchSKuwsn6FIuOK4BuLYMIU6OrvVIqKTfIDf5kMBUPA9MQpNWNA5iM
 atvkqs2J+sgZwNBV+b7S2sRhzxlF3kYdf0DyQ/deEdY909QHkvTQKS4WtZWzvlWrv2n1TJV/WKh
 4lKuE+1hZYV4zXImk6dbU4N0=
X-Google-Smtp-Source: AGHT+IEnpFy191itLcoB//AnH3megdJZpyCSPbCOgwUg9kkXA2KerFuhOqOhJ+x/qxcDh/YjF64puA==
X-Received: by 2002:a05:6808:2022:b0:409:f8e:72a4 with SMTP id
 5614622812f47-40a71d94b1fmr257274b6e.2.1749751120206; 
 Thu, 12 Jun 2025 10:58:40 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-42.totalplay.net.
 [189.203.100.42]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a6820168dsm378704b6e.4.2025.06.12.10.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 10:58:39 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:58:36 -0600
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20250612175836.GA237915@bill-the-cat>
References: <20250602135935.232370-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20250602135935.232370-1-patrick.delaunay@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: caleb.connolly@linaro.org, jerome.forissier@linaro.org,
 Casey Connolly <casey.connolly@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 ilias.apalodimas@linaro.org, u-boot@lists.denx.de,
 Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@arm.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 0/3] Restore support of short name for
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
Content-Type: multipart/mixed; boundary="===============5738635804834464649=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5738635804834464649==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="weP8gKlYmH0yDAcZ"
Content-Disposition: inline


--weP8gKlYmH0yDAcZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 02, 2025 at 03:59:31PM +0200, Patrick Delaunay wrote:

> V3 version solve issue for "ESP" support when
> CONFIG_CMD_EFIDEBUG and CONFIG_EFI is not activated
> for example for test with qemu-arm-sbsa defconfig
>=20
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
>=20
>=20
> Changes in v3:
> - The definition for ESP =3D "system" partition in list_guid[]
>   is no more under CONFIG_CMD_EFIDEBUG or CONFIG_EFI flags,
>   and restore the initial level (always support for display)
>   as it is done for MBR partition or when U-Boot is a UEFI
>   loader (CONFIG_CMD_BOOTEFI).

This still has CI failures:
https://source.denx.de/u-boot/u-boot/-/jobs/1168239

Thanks.

--=20
Tom

--weP8gKlYmH0yDAcZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmhLFUkACgkQFHw5/5Y0
tyz3PgwAo2EtVz10B4+yJb3mUJIW4ZAM8rbxn45RA7xutcVD5iwgGFIxAehrB0Lk
c3RI+BIo/xdk+lcqThtLcp0tMkK0HhkPPymKpK7SSbgNUaDKhpBEcML92OTxMbRh
77KVGcyXMocckJ+CsaOTzDKxvGhLERTKcnHswwT9Ag1irMafrIQlKnMtiVYVW+1o
LisjTPjzFKSNn7xGaMLqCTB0yTtaKo18KRKbEpdyQUHxukUlJrHKYbL0nPQfQ5QG
EglaoqRjV1doGZElToEZCGnCEzroc6WQv4eEl2FMmCZf0SdOTbAk/0294z8p0N33
n8Ldnev8zPuCD9UgjSPVQ2E15miOcb1asBlzPvfupu+Pw9ExKTmMtI96n6vSjkY9
5f8Bew1dvRC3psdSSmNMg0WyY7EhMOF+nNlRC5P5sRxtJXeSWC17Udvv9czLlX7t
kjNRi7PZ2XXEn07Zh8vtxAlYN0JGgO1V6OilJA0fhZ+Po4OtuztOFmEGshguH07P
KVWQzA+N
=pzQO
-----END PGP SIGNATURE-----

--weP8gKlYmH0yDAcZ--

--===============5738635804834464649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5738635804834464649==--
