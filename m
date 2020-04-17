Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B71FD1AE742
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:08:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F1F4C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:08:50 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 963CDC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:08:49 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id t3so4038925qkg.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qWd7hRTMOs9SD32vqgN4O1uSRWUJL65nGminCBVFPCI=;
 b=hGHpQOdvb/qGdrcE3queDBJWDlddOacTneV3T8KztREExT25wJFwHAJBA1V8F8BMCB
 IWwMyRu+6KDPQJTFRO4KZC/y3b631bm1Xy51S6ep3MoBj+zbIt+hgV4uYVZcOhbhZi2g
 yeoR0EbtqsBc7vYWyvCeal9kjSCxV6VFrVm1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qWd7hRTMOs9SD32vqgN4O1uSRWUJL65nGminCBVFPCI=;
 b=HvpnIaH6AfpqswDVb6dzqDBXXegy4jDEpjAihbw5PTilEVALXdZTK0JNSljGk5wTw2
 gOGLLqcHMB4pELLoJyxdwkCriasPzEmjUeABmmkSwcIfgrI4xjjvXPbADnTqEPYjjulu
 tzVuGG9cV3BfkyTv78JHgB2kfcswbnPqU+3f3iS6iIasKQI59cAD1imiMpmfsIwlTrAB
 6Y1D3UHrGAW6+0oVKGZnpHBoFhB0MFoV/IbHOdvdLYy0eP6g+Ml1ltoHwLbQnfX39FOz
 4z8+nNKNfeJtR7jyjUgGzYkEb4u18mJhJoywFcx9lUL/skq/Dlzy4+jvysf9ABSlqDK7
 tdow==
X-Gm-Message-State: AGi0PuYPeIhqR1NsRq+q2/c4EqPjTUqrvcSjRuDeQ3vR/hqZdTnEIr1j
 5cLCqaluj0WRHiKcItm2mPhSCQ==
X-Google-Smtp-Source: APiQypJwEMKxdob07QKCte9EOty6r8laqGUhw+7tYS/DQdcHuwocmWC6mAQ9Lf/1Yd8ddZ0y5SPAUw==
X-Received: by 2002:ae9:dd85:: with SMTP id r127mr5128045qkf.58.1587157728517; 
 Fri, 17 Apr 2020 14:08:48 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id m7sm9631081qke.124.2020.04.17.14.08.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:08:47 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:08:45 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210845.GL4555@bill-the-cat>
References: <20200310091505.24862-1-patrick.delaunay@st.com>
 <20200310091505.24862-4-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200310091505.24862-4-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Stephen Warren <swarren@nvidia.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Glass <sjg@chromium.org>, Kever Yang <kever.yang@rock-chips.com>,
 u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v4 3/4] arm: set the relocated gd with
	gd->new_gd
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
Content-Type: multipart/mixed; boundary="===============0083449792552480087=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0083449792552480087==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k9EanI4qvbxMqdC7"
Content-Disposition: inline


--k9EanI4qvbxMqdC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 10:15:04AM +0100, Patrick Delaunay wrote:

> Simplify the arm relocation behavior and get gd directly form new_gd,
> as it is already done in crt0_64.S:
>=20
> 	ldr	x18, [x18, #GD_NEW_GD]		/* x18 <- gd->new_gd */
>=20
> This patch avoid assumption on new GD location (new GD is below bd -
> with #GD_SIZE offset).
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--k9EanI4qvbxMqdC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGt0ACgkQFHw5/5Y0
tyxsAQv9HMoWBz7P9VUSoUBH8Aj3B3OoC15/mkQE7M/CP3761CMNpkutCvclpAI5
7CKh43f5JIyyzae50B1zLDr3sAQ8qgDC2KbMuEnAOsToh3yzCV4GaeV8SHLRA4pg
jBykcmB4Thb4UhrvdZ60MrutmYWU1LuLOBdBUHoPVfA0x+odjoThwq/I1rAHriZ2
kUW9PVfIQEF5gvQLxMIVQzIKlFRThHQt1m4k7jvI4PUwTe4cl3Emkmxbr91pOpy6
P4S8LPVl1z5AZ/92s5UkaVFS5hafSiN1NWWdtMqEMK0O3czppeA0xksJzokzpgML
IfoEAICeRdM2B549bZTgQDC+b1d+/7cv0787r0GFeeb/okGQxE+GjzLW4MrTdSk7
h5V0LxI65uoBwxJkGEct+fVSF9MvULv7+N/oqE+8QKPpBfGYIhySdOJyvQdvktXS
xaZSawvlE0grKyXKhPEcfdkLO3fqgiaKeBcEXm6Je5u1GwfaWoZb77jjms1G1NuC
SBDlGwGN
=uK6T
-----END PGP SIGNATURE-----

--k9EanI4qvbxMqdC7--

--===============0083449792552480087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0083449792552480087==--
