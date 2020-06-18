Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E391FFBA4
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2020 21:17:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA01AC36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2020 19:17:25 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D2D8C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 19:17:23 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id g11so3320825qvs.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 12:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WtugvnGyn7t7t4sw8GCh9b7gipWVk43Af9NPvdBlgfc=;
 b=H5zviYrJQynYQmZynUScjN8tqq2b+Mw36sQgkrwr0KuLxJg0f0BsQWjhGneMKothgs
 qgylMgdwnmqeqvyKcydHhJbRVGv37vyF+39/DloHBOHe7GEBjizOfClWaci+xYOM3X0I
 L8Ng/SvaeLUZoARbDEGoL3ZLUaIot/GjEpcZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WtugvnGyn7t7t4sw8GCh9b7gipWVk43Af9NPvdBlgfc=;
 b=ckHvgTV9S9c6ZzHNiE/suV1WOAW7Lse2/RY8QuQh3862OsqFZ8sBLkz7EYQ19mSyGY
 VG4z339AqZIrjHmYFgmGhs7TwT1slggLwx/+frFmjLiwlO7xY/E3HhmiW08A9L99EYrY
 ZpAZr+oT3aKAIeKlqvnfmTrIz+3Lkj+PXd4ANUEPZxFbXfQQtxifSVA+QdOLJzfoPv9w
 nq9BhPFM2U2uaD/3KicNt69nBv+qeLFOyMFNsx0MnWIJDrP6sew6/+CRC/r/cHPyK6c9
 /4ezFi0gk2fuxcO/IyGutLObnnG8Jx+JBSwT1zDCl626794Re8s8b1zLAsjxjupx6tC7
 7mlg==
X-Gm-Message-State: AOAM5332L+6TuAsDPYftNXsdFzHH8BbqQnzILlH5Ef3IE1sMffzAvcjx
 Lm7MEME5MSUrqChnDXH5TXrm7g==
X-Google-Smtp-Source: ABdhPJyLkjAmzK5cCL3OlXqqiYIMRqV+bz+2Gx9zmlmIWHxgV+aiTRT1fe0T7QhaImj3z3ULmxyZ/A==
X-Received: by 2002:a05:6214:1432:: with SMTP id
 o18mr5126783qvx.57.1592507842498; 
 Thu, 18 Jun 2020 12:17:22 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-3530-e3a2-751f-ef7e.inf6.spectrum.com.
 [2606:a000:1401:8080:3530:e3a2:751f:ef7e])
 by smtp.gmail.com with ESMTPSA id c189sm4193369qkb.8.2020.06.18.12.17.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Jun 2020 12:17:21 -0700 (PDT)
Date: Thu, 18 Jun 2020 15:17:19 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200618191719.GV27801@bill-the-cat>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-6-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200616074048.7898-6-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>
Subject: Re: [Uboot-stm32] [PATCH v2 5/9] sandbox: support the change of env
	location
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
Content-Type: multipart/mixed; boundary="===============8223441759048420028=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8223441759048420028==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zmbF4WfaG2f6E7cU"
Content-Disposition: inline


--zmbF4WfaG2f6E7cU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 09:40:44AM +0200, Patrick Delaunay wrote:

> Add support of environment location with a new sandbox command
> 'env_loc'.
>=20
> When the user change the environment location with the command
> 'env_loc <location>' the env is reinitialized and saved;
> the GD_FLG_ENV_DEFAULT flag is also updated.
>=20
> When the user set the same env location, the environment is
> re-loaded.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
> Changes in v2:
> - change cmd_tbl_t to struct cmd_tbl
>=20
>  board/sandbox/sandbox.c | 42 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)

This is for testing, which is why it's on sandbox?  But I think we
should have this be a generic opt-in feature as changing where
environment is saved at run time has use cases when we have multiple
available.  Thanks!

--=20
Tom

--zmbF4WfaG2f6E7cU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7rvb8ACgkQFHw5/5Y0
tyxfGwv/ZVOWoGfbD1Le3Et8zR1M9JhJLBLvnPz2/GUqIx8yG/6RUFrgRUaAxQJy
T8wSroe0C4OIhtOXSDb/yNy1Yn8OXqmB0ERMdD7mD+k2XpUhYwIZblE0DcQNJjpI
Fsy1qUYsggwkyccRNlHdi5rOf47Adip58HxyytNZTOBxqakWB7cGoIoDkkZHklGE
jgntjXRo8K3rUmFoO9+wELagV/MTVAPdLQ7s1ZCkC4PMUYjfGrXPuvxxVGTKEDuf
E5cYNnMjbgW4Da4DXuUS9Gxt/FA+PRN2kEg5/CaymMeAxBkIipR8hs+Jgyq2yIXR
gLJt2WYe2IGeJVIer4C2IFiLTrylD3DMhRmizc2by+pUnbWzAFxHtMM+/OE26ce8
l5CeXPynk/nK1IFtrGEe+CZjr1thcxtrO7xS6IQJPR4OII4OMrZY3IWgNHtOUGY5
onXiAcumgp2QEX+G9GfsDaiLhnN76epHqD42L9oRUHbrYhxcMRNRth+EU09mYTgB
4kn8Dxqf
=2gwY
-----END PGP SIGNATURE-----

--zmbF4WfaG2f6E7cU--

--===============8223441759048420028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8223441759048420028==--
