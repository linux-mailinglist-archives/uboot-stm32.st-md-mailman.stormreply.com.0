Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CA41BCCB2
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 21:49:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EFA0C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Apr 2020 19:49:17 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3964DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 19:49:14 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id h124so5923625qke.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2020 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FvL0nbICSLss7Y7xwTPvjx7Sp4bxY7CgDv2jX3ExBTc=;
 b=Ag6LeG5J8q6wHZsdFpaOQzgz+YdKWcGhwlI8cz51JdtZR0zNptPViPv2BRI/K25RLu
 Sx6G8NCxQeUTdjLxBwHSKpcvxzaSnvrGM3tsXNPtyj+aBXlvr/jA8Q6bz2uklMA2e0Dz
 bMLvC6HN3smOSgFrl3+Hv77FlqhWw8BRP6Utg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FvL0nbICSLss7Y7xwTPvjx7Sp4bxY7CgDv2jX3ExBTc=;
 b=s/JEomaU4bf7LPcdmxDRFQAYZqPMBx+FpWE2Wty7q+BbA4d3fxRkXarWZakX0MQ2OY
 q/h+TRvueX8bOixEN+p97hfgvuZQY5caoQ0mNUW+CFBfOsNfWqHDMCzRsXuiFbvorc0d
 q3LKzUZDXzHHfqS5/intnN5ImtKTIqSMFheFRZUVzTk93dq2aeQp6OV2xhbhsBWPveLy
 7SEEufuUq4k0QdxmihvvQqVE4TRCvqStLebxkfXz9iEszBjbubJnTmbt0OZsvFSvtWc5
 c3Lkpv12swXMbkCZlPlXjxAHBWKaaj/xjHywATL4H1Cg6euGRhIZ0SFla+N/hkRyEohl
 O4oA==
X-Gm-Message-State: AGi0PubL3VmMNT3KCS2qAFQ6d4Meuz4dmCRtUKn46dJae5q808CK+HJA
 u8Lmw7Lml2SiXg82wpAIjR01cg==
X-Google-Smtp-Source: APiQypJVCsxb74+6c3IFAJeuxeDQeq26qXynoiswHOIW43eE2xpWi3l8tP5m//u4fuGpIpRyXJtymg==
X-Received: by 2002:a37:6454:: with SMTP id y81mr27765575qkb.266.1588103353784; 
 Tue, 28 Apr 2020 12:49:13 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-c4e8-427e-eef8-640c.inf6.spectrum.com.
 [2606:a000:1401:826f:c4e8:427e:eef8:640c])
 by smtp.gmail.com with ESMTPSA id k127sm14076480qkb.35.2020.04.28.12.49.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Apr 2020 12:49:12 -0700 (PDT)
Date: Tue, 28 Apr 2020 15:49:10 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200428194910.GH4468@bill-the-cat>
References: <20200424182017.11852-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200424182017.11852-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 u-boot@lists.denx.de, Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 0/3] arm: caches: allow to activate
 dcache in SPL and in U-Boot pre-reloc
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
Content-Type: multipart/mixed; boundary="===============1430211734822523037=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1430211734822523037==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wXC5D88JtmMokAwr"
Content-Disposition: inline


--wXC5D88JtmMokAwr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 08:20:14PM +0200, Patrick Delaunay wrote:

>=20
> Hi
>=20
> It is a V2 serie after Marek feedback for
> http://patchwork.ozlabs.org/project/uboot/list/?series=3D168378
>=20
> This serie allows dcache activation in SPL or in U-Boot preloc stage
> for ARM board.
>=20
> See "arm: stm32mp1: activate data cache in SPL and before relocation"
> for example of usage in SPL and in U-Boot pre-reloc of the function
> dcache_enable() and of mmu_set_region_dcache_behaviour().
>=20
> A branch named "dcache" with the needed patches for stm32mp1 boards
> is available in:
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
>=20
>=20
> Changes in v2:
> - update patch after Marek's proposal. but I just divided by 2 instead
>   of 4kB (minimal MMU page size)
>=20
> Patrick Delaunay (3):
>   arm: caches: protect dram_bank_mmu_setup access to bi_dram
>   arm: caches: add DCACHE_DEFAULT_OPTION
>   arm: caches: manage phys_addr_t overflow in
>     mmu_set_region_dcache_behaviour
>=20
>  arch/arm/include/asm/system.h |  8 ++++++++
>  arch/arm/lib/cache-cp15.c     | 20 ++++++++++----------
>  2 files changed, 18 insertions(+), 10 deletions(-)

All in all, I like it, good work.  I'll pick it up not right now but
before -rc2.  Thanks!

--=20
Tom

--wXC5D88JtmMokAwr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6oiLYACgkQFHw5/5Y0
tyyS2Av/UL0krU0/Xov7cKGwsga6Lj8EZ4K0WFIUFRm5Cou1B2pw+qumxBznt42M
cfzHSQuR9avIsL43o2B+t/d32Tz3dysxLRMx1nz7P+83tkebGUufmiuBsL+IoUuN
KjMKA0sBAzHtEoW6xxienRUA7enVpz6rq2ukfVkMlsOQ5v71DU523DYbwfADWMzi
hCQZCygZWYNv3VzX4UaL69CgsofuLVtj6gsB83vruwxXHy9C2nVgga/k/pqEpNOx
uUtvi7ROVxU/8Pw/b3uhkSsx7yjKAE3sMYQF5vygjhbtN2jIOEU94s6ir9A6TwBt
kSVKJh3i1g+N07TFaGc+9qbsRBy96q9HvtTwiab/uKHg5mNjKp4Tb3sPvKYxfM4n
GsZ9vl7JTldjDf9l5UBSMGamcJu+Hu3pKXIp8wBy7aTsk2/Jp8DH9MR+lL1KzyRg
dUTy2T+UG706UZlxuGHYZuC+trxuln9x7jpqRsmNju2q0P4KN6tlSTe3etBJ0mWW
MeF7QXCE
=i/fL
-----END PGP SIGNATURE-----

--wXC5D88JtmMokAwr--

--===============1430211734822523037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1430211734822523037==--
