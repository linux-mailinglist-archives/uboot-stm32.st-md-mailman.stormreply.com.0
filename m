Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4581FFB9F
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2020 21:15:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39E69C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2020 19:15:37 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 044F4C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 19:15:34 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y1so5337879qtv.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 12:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b4pURu3io0wf8O+DKPkD0aii/ya6CrF3DkmlvJwr8M0=;
 b=NZgfXgLCBZDvtM3eHWoC1cIwmiiPwxXQ9Ui/qT2lpq2iaYKusLW089SGQD+Aa+qEjH
 +RCZYlG25Qr4JBfZasQpCd2v4UxfOd1c1ONAs+LEyFPsLgyJEv6r0MeiyQkrpyXNWzSJ
 A7umAq0nKtqAONYTcnLol75lKqAXRLZHpWKMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b4pURu3io0wf8O+DKPkD0aii/ya6CrF3DkmlvJwr8M0=;
 b=Ibap7Fx9j2jcEACq3glqPFGgB/BlglIjW4pRzwAvuaAnZrW6vMVCh+dYcnU60NyyIu
 mZpd5/wnVAzwKELEo65W5siCZb17tgalUwPpnj+XH+ZEvYo4h82hGlGvXe0gsoA07gnU
 H6L6G580Ri5eWi85xHf6IqPgfH0gXT9hQ5R6Rz55a0cu6zK5vHfnb2TWRUcHoTQIMYPt
 jqiFsTP5uya4OwaDhE0khzoWdixRzfpwQ9Ndm0XBJCOR9D9UD5J+5LleRiAlSUvzjqg8
 nNlwoaN+7Rwk97ig5ZSh1PUFgWW3B7rE17sufO/6tEsOoeiy5qjYKbqc/Er9TuLTh4co
 l2oQ==
X-Gm-Message-State: AOAM5304Ls/c6pLEKXGhtDJHpMq3xURuuqHFXn/P7BcV+7KqSGZj15+k
 yaqG46g9BvT37iTPdJyix8fbYA==
X-Google-Smtp-Source: ABdhPJwExE9uzIMcRBp/XDgZRKNiP4UeO6Bo69206n6ugTTYKQASeQ4tJQNDE3xIQS0X2YECV3JsMA==
X-Received: by 2002:ac8:2aed:: with SMTP id c42mr5936813qta.202.1592507733324; 
 Thu, 18 Jun 2020 12:15:33 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-3530-e3a2-751f-ef7e.inf6.spectrum.com.
 [2606:a000:1401:8080:3530:e3a2:751f:ef7e])
 by smtp.gmail.com with ESMTPSA id v14sm4095025qtj.31.2020.06.18.12.15.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Jun 2020 12:15:32 -0700 (PDT)
Date: Thu, 18 Jun 2020 15:15:30 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>, Marek Vasut <marex@denx.de>
Message-ID: <20200618191530.GU27801@bill-the-cat>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-4-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200616074048.7898-4-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/9] env: correctly handle result in
	env_init
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
Content-Type: multipart/mixed; boundary="===============3356230071768047988=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3356230071768047988==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HC0F8i/BfMshQzR8"
Content-Disposition: inline


--HC0F8i/BfMshQzR8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 09:40:42AM +0200, Patrick Delaunay wrote:

> Don't return error with ret=3D-ENOENT when the optional ops drv->init
> is absent but only if env_driver_lookup doesn't found driver.
>=20
> This patch correct an issue for the code
>   if (!env_init())
>      env_load()
> When only ext4 is supported (CONFIG_ENV_IS_IN_EXT4),
> as the backend env/ext4.c doesn't define an ops .init
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
> (no changes since v1)
>=20
>  env/env.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/env/env.c b/env/env.c
> index dcc25c030b..819c88f729 100644
> --- a/env/env.c
> +++ b/env/env.c
> @@ -295,7 +295,10 @@ int env_init(void)
>  	int prio;
> =20
>  	for (prio =3D 0; (drv =3D env_driver_lookup(ENVOP_INIT, prio)); prio++)=
 {
> -		if (!drv->init || !(ret =3D drv->init()))
> +		ret =3D 0;
> +		if (drv->init)
> +			ret =3D drv->init();
> +		if (!ret)
>  			env_set_inited(drv->location);
> =20
>  		debug("%s: Environment %s init done (ret=3D%d)\n", __func__,

I'm adding in Marek here because this reminds me of similar questions /
concerns I had looking in to his series.  At root, I think we're not
being consistent in each of our env backing implementations about where
flags such as ENV_VALID are set, and return values / checks of
functions.

Just outside of the start of the patch context here, we set ret to
-ENOENT and just past this, if still -ENOENT we say ENV_VALID and point
at the default environment.

But, I don't follow the patch commit message here.  If we don't have
drv->init we call env_set_inited(drv->location) but we won't have change
ret to 0, which means that later on down the function we go back to
default environment.

So isn't this a problem in most environment cases then?  Thanks!

--=20
Tom

--HC0F8i/BfMshQzR8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7rvUsACgkQFHw5/5Y0
tyzBPAwAjiXiKJQgc9yWE0FA+OESRHZSLsETJyJSbVW7yTAbp6NxiTy7xK8IQlfq
a/aISICYhvQLvyWCsm7OtHSWApHv+yFI6U+U1J9mKGuvyzP9bzoObVV8ZVwdfKK9
98G49sJLd28+wbpHoZQUk7xc97msLDPn5dWwe1KJD3UsDFie2MQE1iUsMB6/zIDd
4KE7RQIlY904hn8en8MTXoWj5p4gysVFcRMSKjUFrkdQwY/AsAAX+H6Bi/a+FD0X
n+j5ie5x3Aqw7WlcjvfjGRtjoCoo4XbZHgBuAHuhKuBG+DoMMiUzhHKuljFVONGl
22/Jv5kie8SOCITW1kvTxS9Kjp11aoeEnly0qKFJw25JLvWPFl8AEraqfvJIOgWA
EyrT8x9sx0JEYQ8gsemN63uqKE0AxgTY16CEjJar5nMrihUNcY6KPTJT9sYgDDaq
PLAGoWtLH4StZwHbEzuic6ThGkdpTEN8pOYN8L9D5TFtH8rMR4/PjYll6gzn53Vb
dvVT6LGq
=PYXd
-----END PGP SIGNATURE-----

--HC0F8i/BfMshQzR8--

--===============3356230071768047988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3356230071768047988==--
