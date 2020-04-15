Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 158E51AB20F
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2020 21:53:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C3B7C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Apr 2020 19:53:39 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7CB8C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 19:53:37 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id c12so791485qvj.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 12:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=abQm4xOWc45nQNZXkpbpMW7jwTMxGGcBbI2lu/+HHJI=;
 b=Pe0D633WL5E02AoB5VCm0Fp8KjFmx12iZVrGWn5/Nr2x018GaY3VUjTe7m1CrGpVFw
 fEnG1zR32n8+eSsrh82uiIKOS2NYb3qysCOj+X1gbbWuxnp24QLir/LEJlcsHGjm5Ceu
 XnHx/BNeZVhp2b8Jc3UGERLnx5YueMrpo8ugY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=abQm4xOWc45nQNZXkpbpMW7jwTMxGGcBbI2lu/+HHJI=;
 b=InLZxA9pyfI+Ax6bkzJFsCmcL5UodBeLSLY0AHWtIjjpdQfYeZshFRQyTeXFwJ4Lc8
 6taA7lh1n1JN4TLihuKnRfYCc56S0M/DmZlXxBijiKJIwuoxhaT6jlvL7LweRJTSOOgz
 fV4EWITpVBhGURgvI+bGEYgWxGQJlxEXyWCfS2u3LYrfeAek4wAsS2qLoY/4wr1gCQS4
 O0OMJLe8y+VY08tAJuePFyPKy0/1sZc7hnN2WRqEYMEjqz01IdOggCF5P4bpH3GEr6sq
 /8XRcngfCJJhl5rka71dQRy5pd20M5IK1bfKapfU91GtEoO8EbZ+FJ84IAxkGS8fYDTE
 197Q==
X-Gm-Message-State: AGi0PubaobBrf6FAb/vGyu79qDX06o/b40L5UOVrRF2hSe6+Kc3yPtAv
 b3chbnqaYSty0JQK9mcuUCD/Dg==
X-Google-Smtp-Source: APiQypK2qa8blBy5RMd/OTdiIhtN9JYiVgPdETEESPF66XN/Kp1ze3XSgjVdeW9e1263ym9m14q4yw==
X-Received: by 2002:a0c:e253:: with SMTP id x19mr6282932qvl.151.1586980416402; 
 Wed, 15 Apr 2020 12:53:36 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-e4d0-34ea-46de-51b1.inf6.spectrum.com.
 [2606:a000:1401:826f:e4d0:34ea:46de:51b1])
 by smtp.gmail.com with ESMTPSA id a136sm13466294qkb.15.2020.04.15.12.53.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Apr 2020 12:53:35 -0700 (PDT)
Date: Wed, 15 Apr 2020 15:53:33 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice CHOTARD <patrice.chotard@st.com>
Message-ID: <20200415195333.GF12111@bill-the-cat>
References: <b59678ac-356a-5118-6948-5913e7b63dda@st.com>
MIME-Version: 1.0
In-Reply-To: <b59678ac-356a-5118-6948-5913e7b63dda@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Christophe ROULLIER <christophe.roullier@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm/next
	=u-boot-stm32-20200415
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
Content-Type: multipart/mixed; boundary="===============5545953406373792138=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5545953406373792138==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uTRFFR9qmiCqR05s"
Content-Disposition: inline


--uTRFFR9qmiCqR05s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 09:08:04AM +0000, Patrice CHOTARD wrote:

> Hi Tom
>=20
>=20
> Please pull the u-boot-stm next branch.
>=20
> CI status: https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/=
2759
>=20
> Thanks
>=20
> Patrice
>=20
> The following changes since commit 142a07f2a44262d76fec609e1fcde51794a456=
eb:
>=20
> =A0 Merge branch 'master' of git://git.denx.de/u-boot-marvell (2020-04-14=
 08:47:07 -0400)
>=20
> are available in the Git repository at:
>=20
> =A0 https://gitlab.denx.de/u-boot/custodians/u-boot-stm tags/u-boot-stm32=
-20200415
>=20
> for you to fetch changes up to 71ba2cb0d678d2c29dadd5fcca61ce3942876ee6:
>=20
> =A0 board: stm32mp1: correct CONFIG_IS_ENABLED usage for LED (2020-04-15 =
09:10:12 +0200)
>=20
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--uTRFFR9qmiCqR05s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6XZjoACgkQFHw5/5Y0
tywnagv/QvZJlSploArtAyA00Hs7beN6hmOZgmhpED6e+ufGc1hX5PYaf3X4S/+I
mVl4BRBxe3xRp+k9bJeSE3Q3pIsN5LngDAcxBtn3T+awGVjui1qnKmHltoICbkuA
zi89FhlMnWQQmUzBDSSIQpOw0Wz7WE5PVNqSV+mB6XWFrpbKPrguAgCGC6rx/tS1
2a+PjnO2HEwaa6q6glza+rHGHaemBc9ftKUco3J9yHTtHwdqH3aeHgjLfZsAPvfl
FGQIlvqkd770hqcX4NNQn/A0OBtWxnlHY+VZuvb5CWFFliA+oQc99XgPNU0Gdw34
4RtTIAnI/P361XbA6igxluf+Ncn+k7vx3/Wl7psLzg/+OpjtOvgizuf8opNcSA2H
vNmumkGbY+D+BuuYf/Di77GODhkR9LYHd53T16nIb1Ptfy4DPn7Bv2bnB+NWsDrN
AQJwdwKBLHZ6aBvyDZMh3rm+uoVacJKyHhR8fQrKkrUNGclXBsmh2QB+K1852SLN
1khHkEVx
=aQSu
-----END PGP SIGNATURE-----

--uTRFFR9qmiCqR05s--

--===============5545953406373792138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5545953406373792138==--
