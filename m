Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9498B23A9DE
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Aug 2020 17:51:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 553FAC36B38
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Aug 2020 15:51:42 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0AD8C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Aug 2020 15:51:40 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id l64so28730366qkb.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Aug 2020 08:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cDY8j5n3h1dEfnXT1blijVs0DAGE7DiSpx1BaxbAIlA=;
 b=m6okI4glpjql4uimgdwqnN175Fa4kcjL9riFSAZJSS6Nlmb/+l/ZFwJYknJcZ5ZAt8
 uy5hnv+Aq7doBsWa96yqlIeRY7SoST2SZKFEVpDznLTgvXhaXYZ2q5tku6u2bdwd0X9G
 l98m6BIe07BXiyMc4qU98FmyItbz+5XXcK20Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cDY8j5n3h1dEfnXT1blijVs0DAGE7DiSpx1BaxbAIlA=;
 b=BRTC7JCpLvGgHK2mn+GQ3UNHau39SkM8KGpaRTkZsZyZ1rT3dm40lgM5W4C6O889hR
 7iYdjQaCNqaHbmZ/xqHMQE1cKctLS7ad9VWAhoPijlglM6Y50mSsfB4HVI0er87ZqZJR
 oAvB4f9Mo5QpGBUJDaV1CBHeSl63p58tM5wISkOxIXHnhODTnZy5xBYZq9MeLcuKvBkL
 1j+HcA2A4TVbpbE28saJMaatm5LRyR4l6IYuS5HHGREtMUSP254mzRCoOWnhbTqa6bq/
 NO51koVxgsbgMq6aT2YV2/fXGNKOy2mVgZxh4vj9XUgaz1NhdUTBHUZbppyvcWpHDzkE
 nTiA==
X-Gm-Message-State: AOAM530DdjQw8Yjdd2Bku/LM1ZrnH/Ji2OOBFgTPOdKCpYLJgs7YCYie
 AIqY93WUqF69+3573Tyth7NxEg==
X-Google-Smtp-Source: ABdhPJxwBIrdy5jBCinluqEXJpZiz7PdJEvUhgkonlEwv5SsPYeUfL1I6OSzmK6HWGdR2cmM/9CXxg==
X-Received: by 2002:a37:b204:: with SMTP id b4mr16706976qkf.50.1596469899466; 
 Mon, 03 Aug 2020 08:51:39 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-5065-2770-ca2f-60a0.inf6.spectrum.com.
 [2606:a000:1401:8c61:5065:2770:ca2f:60a0])
 by smtp.gmail.com with ESMTPSA id l64sm18858195qkc.21.2020.08.03.08.51.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Aug 2020 08:51:38 -0700 (PDT)
Date: Mon, 3 Aug 2020 11:51:36 -0400
From: Tom Rini <trini@konsulko.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <20200803155136.GT6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-12-patrick.delaunay@st.com>
 <ce21c47a-e485-71f4-0a6a-1d66a9a166f8@wwwdotorg.org>
MIME-Version: 1.0
In-Reply-To: <ce21c47a-e485-71f4-0a6a-1d66a9a166f8@wwwdotorg.org>
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
Content-Type: multipart/mixed; boundary="===============0278125432908841400=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0278125432908841400==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HevQWRStXZ0Cpw2M"
Content-Disposition: inline


--HevQWRStXZ0Cpw2M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2020 at 09:43:18AM -0600, Stephen Warren wrote:
> On 7/28/20 3:51 AM, Patrick Delaunay wrote:
> > Add basic test to persistent environment in ext4:
> > save and load in host ext4 file 'uboot.env'.
> >=20
> > On first execution an empty EXT4 file system is created in
> > persistent data dir: env.ext4.img.
>=20
> > diff --git a/test/py/tests/test_env.py b/test/py/tests/test_env.py
>=20
> > +def mk_env_ext4(state_test_env):
>=20
> > +            u_boot_utils.run_and_log(c, 'mkfs.ext4 -O ^metadata_csum %=
s' % persistent)
>=20
> Is "-O ^metadata_csum" necessary? The mkfs.ext4 in Ubuntu 16.04 doesn't
> support that option, which causes this command to fail.

Yes, it's required because we don't support that feature in our ext4
codebase and newer tools default to enabling that.  Supporting that flag
is on my wishlist of items.

--=20
Tom

--HevQWRStXZ0Cpw2M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8oMoQACgkQFHw5/5Y0
tyzlHAv/YjTYz/JqiuRpEB9LhroMWi3WA7loTUhkLjUbU4PdwQowXXuFqYqNglAB
lP25RKmj+GRzsIPov5fukeBZT8edd4EXDnaxy0SQIXa7g3uYK36yNpNAKeqJ+ecU
H+2kTk45oK2Fw10AColCYz/zSQO7tuLu5Z1tL24P/dOZH9NgmqVTSi0OjQPRAdky
WozFWAJatwOLsjN/XyE7wvyQJHInDY3mxRSADq8n0PS42AtHyWNb3+FbkNinHwyU
rmSkxZNH+PZXOgVrvf6pGiQud78cJUDPTJiy4iCPwEsPGxwqYSuioZdxMuV9Rdeg
Hk1GYkLT36p7PdHgCEHpBnp+Fwd+J+ASSYlgLq1z0zQhQrIgy8aMvIat0GCCsE9P
EEujhjdxWP8VJX44TjVR6TfhX2zAjLa+vOLdqrvS6IFWSV7+5ZvYcCCcBVrchRv1
PItsivVOb+NE3B1dMETcnvGV4Ut9XJhWQOq90U30yxCDvN3O5r2WWfW69A6SpgYE
3i4uuXb9
=7TKD
-----END PGP SIGNATURE-----

--HevQWRStXZ0Cpw2M--

--===============0278125432908841400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0278125432908841400==--
