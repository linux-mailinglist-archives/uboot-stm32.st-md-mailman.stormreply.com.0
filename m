Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5A032BA1B
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Mar 2021 20:08:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97219C57B53;
	Wed,  3 Mar 2021 19:08:59 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09AEFC56634
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 19:08:58 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id bh3so5444619qvb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 11:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MY4CsAyMvSvLVw9lEyj+4REHrwrLGkV2qOz2Dv3gEi4=;
 b=sa+ZCu4GZHB6pXh+b10KeVqX599iKBub70DxgXrTnOPpUuYm6k0WNtB8cbolvTXfR2
 ddarZbRo7GCP+5crPHm9aQW1thCtrO5rTXRA7s79M4w7YSRVeq0hPdS8Nz/B15puRIe6
 Mg+w4nJ5ztqsYoKsgNJqZJQ51tHGzCCm6GrtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MY4CsAyMvSvLVw9lEyj+4REHrwrLGkV2qOz2Dv3gEi4=;
 b=epME6ZDFoWdoGY8belfow/91C924FlRuHKkBAlBur7AqOQP/PHWWi8SJEabeoOOJfp
 FQwyIyFhaodOFaCRY4Pibkmt6G5EE7HowFzUM/5zyP7Td0YS7upBh+DEcZ75QotlLAmQ
 XECnfXD/rnIuz5hEYmVutiFPNlIvkmnCK20YVgXgWrMbLBPx6jL4jv46Jvsl0nldkJuN
 M/tPXa1LY1SuZtZe+nJ59AcJGVVabK9g4Add+u/afUslJTJVkanlAYFuUcg1LI4yBSKc
 s7JK54ngSWu0lkTHulwesByJBkiT5uQtOXQjLvvZys6DJtOXPNdDL3aTtWe/Wx3KV5iE
 1jXA==
X-Gm-Message-State: AOAM531Z1iLxYOqthuBoVLf4xpO056Nz7CY/R01LPHL5ArStEutRVFBD
 VCHsrR+7wFHz6gvn98ON8Q+CCQ==
X-Google-Smtp-Source: ABdhPJxQOE9Z9f+HJsadgSbsmSDnw1LxLjc+m3ePa2Irtv3eFFkHjWTml8HPKRaC/xDwYjSBfkexwg==
X-Received: by 2002:a0c:e2cd:: with SMTP id t13mr677367qvl.44.1614798537087;
 Wed, 03 Mar 2021 11:08:57 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-451a-3a99-8647-33ef.res6.spectrum.com.
 [2603:6081:7b07:927a:451a:3a99:8647:33ef])
 by smtp.gmail.com with ESMTPSA id t18sm16189327qtp.3.2021.03.03.11.08.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Mar 2021 11:08:56 -0800 (PST)
Date: Wed, 3 Mar 2021 14:08:54 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210303190854.GO1310@bill-the-cat>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
 <20210205135332.2.I89418f0518a81f98643b36c248b006e596950c25@changeid>
MIME-Version: 1.0
In-Reply-To: <20210205135332.2.I89418f0518a81f98643b36c248b006e596950c25@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/8] stm32mp: update the mmu configuration
 for SPL and prereloc
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
Content-Type: multipart/mixed; boundary="===============0724925805107473303=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0724925805107473303==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="acOuGx3oQeOcSZJu"
Content-Disposition: inline


--acOuGx3oQeOcSZJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 01:53:33PM +0100, Patrick Delaunay wrote:

> Overidde the weak function dram_bank_mmu_setup() to set the DDR
> (preloc case) or the SYSRAM (in SPL case) executable before to enable
> the MMU and configure DACR.
>=20
> This weak function is called in dcache_enable/mmu_setup.
>=20
> This patchs avoids a permission access issue when the DDR is marked
> executable (by calling mmu_set_region_dcache_behaviour with
> DCACHE_DEFAULT_OPTION) after MMU setup and domain access permission
> activation with DACR in dcache_enable.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--acOuGx3oQeOcSZJu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA/3sYACgkQFHw5/5Y0
tyzseAwAuV42Njt1x6EKqiU+beI8hFulEn0VJfJuw1xKIodDvhjCQIniN32NfBAc
NFGNZoJCLZTguBek/QqAx7bQ11729qIsCWm7sXQaknPLfPRqknmjbMTe3w9RSJMr
S1RLqgGoxu1RoH0jZejKYzAqKlQJpm6CeRrxCePmpXWSdU1Vifa2q/k7/fr8YAba
io6HwgidTeju37LPyhRfRVwqSNe2/0HGuJ0Yk4pqGA5ixLgKwTpml1g7f9nCTfAB
x1Xi8I6YVi3N18wlky+yp8AwXRVeKTSEZI319K6TshjoVRMDIV/iaky2b1oJjyFb
sy7paUrBiMwITwuhq2EhB0caIKmLKbxyTWMb9X8ywAtohGhpceWyEcSdUijgQH0c
TbD7wDBzpR6SplieXRd1ubr59II1Wfd989Vj339qoSJdvgHxLiFbDuHPuK8TtMok
d/+2yJq+EsuQX02zJsAb5BzamzVt6gMWogjky46hexk7TFesiwT8zV3XoM2P4XCU
3jk6A0he
=zk1b
-----END PGP SIGNATURE-----

--acOuGx3oQeOcSZJu--

--===============0724925805107473303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0724925805107473303==--
