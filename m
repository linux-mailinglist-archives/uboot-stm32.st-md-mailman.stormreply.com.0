Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BBD1C2023
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 May 2020 23:56:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3160DC36B0E
	for <lists+uboot-stm32@lfdr.de>; Fri,  1 May 2020 21:56:20 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01906C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2020 21:56:19 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k12so9116704qtm.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2020 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yBrWFhUVCqGjkmD/L0vWYsmmndZgUlhFZlZBggQd6i4=;
 b=rd13nfpfah3QNHIffqn1a5XvspBfXfXfdVsmz/LZA42IqZWKJ/wGWET3uRlw3rZWna
 TBU49229Jar7Ol2qtx9t/IxSaUjg0fyqbfQXtT5pd9hJ6t8VCh3FNwE92tKgOBFJra0I
 ZKDcVnEePx8r7nu4ThA3d6NExRyy8bLXo6xYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yBrWFhUVCqGjkmD/L0vWYsmmndZgUlhFZlZBggQd6i4=;
 b=UdE/aynycKQkWmOIIN0sDafzOkm+t4J2sdTN6jtfTmV/Rnl3PRleBruOVQtSKVO6nG
 RbeJiJrhoEskUu9hmTUvK2aHKuOPztti0c//9c0gBeQXbvfMkVlAwRH5B6eGYq+8KVN9
 UHG4jNLmy35vre9o/XUXPq3BLcXTO7KfZ0ObmFAQCXRBIYaqa9zXJJPD34b/gMH1XbNu
 v6InVkpcpUbFdWs64TgmJ4JSMPGRt+NCNmVxiZTFhrvWvyGloPU4ZX5uqwJyIDsXhLrz
 Jn6vho7C2Wu8HEqYNqHPwD7WilqvKr5K4IYfVLqPRiwy3PayZjmiCvnGkwcchvIviQ/9
 K69Q==
X-Gm-Message-State: AGi0PuZv9NEfQqGpt2WFmz9pjSSkm7CpWWoB5RMUPWXsZI1cQRxG2Hzv
 CDRsDzW359fgl+3YNgOGCfHyJw==
X-Google-Smtp-Source: APiQypJGqhvvTfqmH88DIOT++4k8CecRx+FYLa3y7cRjGgwy8dPlVrxhElVRY2a6Ws98Qrr9jgkdPg==
X-Received: by 2002:ac8:e8f:: with SMTP id v15mr5826820qti.391.1588370177913; 
 Fri, 01 May 2020 14:56:17 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-8453-a408-e16a-eb16.inf6.spectrum.com.
 [2606:a000:1401:826f:8453:a408:e16a:eb16])
 by smtp.gmail.com with ESMTPSA id j9sm3470934qkg.88.2020.05.01.14.56.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 May 2020 14:56:16 -0700 (PDT)
Date: Fri, 1 May 2020 17:56:14 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200501215614.GL12564@bill-the-cat>
References: <20200424182017.11852-1-patrick.delaunay@st.com>
 <20200424201957.v2.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
MIME-Version: 1.0
In-Reply-To: <20200424201957.v2.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 u-boot@lists.denx.de, Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] arm: caches: protect
 dram_bank_mmu_setup access to bi_dram
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
Content-Type: multipart/mixed; boundary="===============4000713328792213916=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4000713328792213916==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U3s59FfKcByyGl+j"
Content-Disposition: inline


--U3s59FfKcByyGl+j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 08:20:15PM +0200, Patrick Delaunay wrote:

> Add protection in dram_bank_mmu_setup() to avoid access to bd->bi_dram
> before relocation.
>=20
> This patch allow to use the generic weak function dram_bank_mmu_setup
> to activate the MMU and the data cache in SPL or in U-Boot before
> relocation, when bd->bi_dram is not yet initialized.
>=20
> In this cases, the MMU must be initialized explicitly with
> mmu_set_region_dcache_behaviour function.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--U3s59FfKcByyGl+j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6smv4ACgkQFHw5/5Y0
tyy56gv+KLiheUVF5i81z/4zh4DimSUc6NumwD2yN3+oIoo7NHvyRPvaypQS5Wh1
SFGl+DzIwOwBPwJ//UgghvL4G1ChEud7vo2akmrVgO2H09uPJ3PaESQfLEbzyVnV
C5mmyDmtawn4+PLIlnNr+9MDvXdcYmDLe2YNrMxDVbnHVwvrUgdPushz8j/wXAcC
zz5Kjqc19ou7u3W1lesjlCHJBoV5K7I5T6G6AM1reNC0HnEDgjbPg2Le+ihRkCvz
gehRgLJT0uiZVvy/qDpSW49iDCyxcAYpAcak1qV3WMlDGZYzc0Ji1ikleQ8yXonV
cPtD5J1FH/TN2sq5e1RJ6ePzrr09HhNGscPVjWRoqBgKJf9U1o6BgFL25s4t4Gj0
mCt8lBwerY05MDS6Be5SqwecakCHlZjM1SlycKNMqVWej+iQ7uky1g6Q6NJC5jGy
kjj1svJxLQzLiNuZsmTGYLQsB3i17Miiuu2ayEBtGJDfuDEphF7VqJHi1vdiEnjv
CpoChdnF
=u37X
-----END PGP SIGNATURE-----

--U3s59FfKcByyGl+j--

--===============4000713328792213916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4000713328792213916==--
