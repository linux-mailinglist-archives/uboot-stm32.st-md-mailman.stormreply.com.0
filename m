Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CDD23AB63
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Aug 2020 19:11:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 634F8C36B38
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Aug 2020 17:11:32 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C95A0C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Aug 2020 17:11:30 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id e5so14736326qth.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Aug 2020 10:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rbiciJm7Ap8L5tlt4Mwl+slSY23RJNxZeSl4rp/Vef4=;
 b=B+LJ15Tq0Yh4lrrx7C9KTWaWhx7L4z29swPYpOq6FnjIGOsMgghtR7N6xOMdN7D74h
 9bBAD+3ut+SEA6w45YjA+L4rqGdXsHuDGy99mzicXyAtLFiRH4YCJcXeARd1JnL7JjD8
 901Oy8WXQI4payDiD4WfwpY2hTHNb+oQVOD2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rbiciJm7Ap8L5tlt4Mwl+slSY23RJNxZeSl4rp/Vef4=;
 b=aZPB8vmW3Ty9cymExkrge2lYYI+5P8fVR9RDjNknv1SLIsqPu9VtXTCRfKNsjhF0j4
 vfbuSfrERzx0a8HDztVzKsdkMHygVk50E3lId8diSL9q/sIr4uVS/QZ9rub0+fomJQba
 HZo3cZJCthvRV7zBHkQfoI9HPLJNy3q6uRWZe0SSt2g3ZsfTFCvrXD1oOFxeKh3bNruM
 KUhXX3nwDw+NfX7PsjnhJrrexz7mQ0OAlQs/V8Rag9PATP8Pa8XCJCjWSNe0d8WPLpUb
 JfOaTkdv5Y2JOWQ4/8PzFZe5DD5EkwEHBh1sqG5eAI2dzJJ4R98c7TpaJJON8h5AoVRF
 symg==
X-Gm-Message-State: AOAM530KRPfM9PHXJrLMFcwSNtSMY1w2bTuspWeSObHcWG095hgsoJ75
 +nX5ms1/T5yrKPnUpSlADUwDtg==
X-Google-Smtp-Source: ABdhPJw5qebeG0WIYusoZima8aTGl/WxIhlQ/hAqrbwScXZ/lg5cqeM/60sZR0XK3b5fuD+ZfyJGCQ==
X-Received: by 2002:aed:2822:: with SMTP id r31mr17223538qtd.310.1596474689062; 
 Mon, 03 Aug 2020 10:11:29 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-30d1-2f2e-908f-c5ec.inf6.spectrum.com.
 [2606:a000:1401:8c61:30d1:2f2e:908f:c5ec])
 by smtp.gmail.com with ESMTPSA id s5sm19279328qke.120.2020.08.03.10.11.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Aug 2020 10:11:28 -0700 (PDT)
Date: Mon, 3 Aug 2020 13:11:26 -0400
From: Tom Rini <trini@konsulko.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <20200803171126.GV6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-12-patrick.delaunay@st.com>
 <ce21c47a-e485-71f4-0a6a-1d66a9a166f8@wwwdotorg.org>
 <20200803155136.GT6965@bill-the-cat>
 <0fb0f38f-243d-9b4d-9da1-099a29f8c0e5@wwwdotorg.org>
MIME-Version: 1.0
In-Reply-To: <0fb0f38f-243d-9b4d-9da1-099a29f8c0e5@wwwdotorg.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Stephen Warren <swarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v4 11/14] test: environment in ext4
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
Content-Type: multipart/mixed; boundary="===============6591555124225100318=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6591555124225100318==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r37Bb06VX9AMv3jz"
Content-Disposition: inline


--r37Bb06VX9AMv3jz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2020 at 10:57:21AM -0600, Stephen Warren wrote:
> On 8/3/20 9:51 AM, Tom Rini wrote:
> > On Mon, Aug 03, 2020 at 09:43:18AM -0600, Stephen Warren wrote:
> >> On 7/28/20 3:51 AM, Patrick Delaunay wrote:
> >>> Add basic test to persistent environment in ext4:
> >>> save and load in host ext4 file 'uboot.env'.
> >>>
> >>> On first execution an empty EXT4 file system is created in
> >>> persistent data dir: env.ext4.img.
> >>
> >>> diff --git a/test/py/tests/test_env.py b/test/py/tests/test_env.py
> >>
> >>> +def mk_env_ext4(state_test_env):
> >>
> >>> +            u_boot_utils.run_and_log(c, 'mkfs.ext4 -O ^metadata_csum=
 %s' % persistent)
> >>
> >> Is "-O ^metadata_csum" necessary? The mkfs.ext4 in Ubuntu 16.04 doesn't
> >> support that option, which causes this command to fail.
> >=20
> > Yes, it's required because we don't support that feature in our ext4
> > codebase and newer tools default to enabling that.  Supporting that flag
> > is on my wishlist of items.
>=20
> Hmm. Is there a way to detect that, and only use the flag when necessary?

I'm not sure.  I mean, we could put the above in a try/except?

--=20
Tom

--r37Bb06VX9AMv3jz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8oRToACgkQFHw5/5Y0
tyy7AQwAowVdtXNyvtJJJ0/tAAqOMRURkSU4neADFQNjIzpfICQk8k2NBqtnu4Jc
Dg1mPHzCYQPnnhsdvR98L7TM2GLAgPhYkSpK6xybm04/fJcr2qGDnCWQTlUgvI/a
9mxsTZTDy52qU/gUHRqRYclLvbE4o0E8hARcphwDPNfiSKwDWZEnEwC6Bb26ivTv
sOXGvNW4cOtQu42apQ2Q/w1mELCflhEDg7xHFm6Lz5tLiBAoJmnw+D3Fmtd/lOaS
8oIuhCDlH6FCgnJIF7wWpk2mTnRi4syETLuZa7QYTHkB8nMO4mBubUO8WwV/pLGg
ddlWfmUjIzvjYBngFoPVrmWwLeKfX9b1ftohmF6h9cXuzBNkDcMLne/u/uWYC+02
XBJJpIhJWRxoBtMtU1jvMthC3xB6yt3o7LZGDhQjrl4JdXaFaVzLVsjYZRPU5gl8
sidW9DBb9+2oVeFQ05FvPfX7KMtVfKm7eiKCfSVX2fHnnPxeWczwOuTK8ZEmwVGX
+OMS65cI
=++4J
-----END PGP SIGNATURE-----

--r37Bb06VX9AMv3jz--

--===============6591555124225100318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6591555124225100318==--
