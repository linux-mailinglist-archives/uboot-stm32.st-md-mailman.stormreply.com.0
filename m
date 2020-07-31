Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 260CB234D40
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:41:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5AA1C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:41:34 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4A76C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:41:32 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id h7so30168486qkk.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IgXDforp4fOCmKY5zybXh7TEEM+VIAc34Z1X95qtiao=;
 b=NKtzj+ajPYAsLVc87EMcMJ23KsHpZE4DwsvrGZhA7y9SQtTEzYW5DYNx4Jlk4oNBhZ
 p4QTJydWFdvKsYNRW1lr/O1MexO2roPSXz/w07muMOtUhpVrVEqJJRi/VxGzJJVji0Mo
 OELhR9RenD3qVY7KJ7x83h3xdTS907vOoWLN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IgXDforp4fOCmKY5zybXh7TEEM+VIAc34Z1X95qtiao=;
 b=DbD3hM7Ya174lHPKWxenF37uNkCkNePjfEEDpd8Q+hYIr1Qpt3JHm8iOwpvypNRYgD
 ukyoqzgh2JVKJBxw3BTyZNXOG6Bs6JzjwFqZc1egH/spAoBwfHwi3MvrBKb9ddqahHx2
 GtsCKgGfh/NbgiGKz7cilociPyFzcJtJm2MrxqRjmeIQQCC0d0g2XauXtuGf25IyH6Ty
 rNtDYJiLraSe83j8LmdneXaJnNoEivh5T+VY0qaGLv5FQZ/sEcpEZMzcN1bg020ueyR1
 9vP9lncJYfLMY6mOVMlHOu6uiT+iCFjKWBrMpd1xmFFvMknNfx3Wk/UqV0KlG8ukZfnE
 9O0A==
X-Gm-Message-State: AOAM533PXh9ImjGBOtk2uSXYxZBd9zwnLqOWXMx11LG2+a8OezWJ8L80
 7wlYNBRyaGypo6wsDgbotz4FXA==
X-Google-Smtp-Source: ABdhPJzK7Si4Xre21Vy5lzM6/JWAK5O3b1Di2Sr049wI8PkGoIrw7hawP9DCiFJCIvT9/Qn0oXviLw==
X-Received: by 2002:a05:620a:16c8:: with SMTP id
 a8mr5984224qkn.81.1596231691699; 
 Fri, 31 Jul 2020 14:41:31 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id d8sm10899876qtr.12.2020.07.31.14.41.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:41:30 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:41:28 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214128.GC6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-9-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-9-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Joel Johnson <mrjoel@lixil.net>, Wolfgang Denk <wd@denx.de>,
 u-boot@lists.denx.de, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v4 08/14] cmd: env: add env select command
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
Content-Type: multipart/mixed; boundary="===============3337449291669026652=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3337449291669026652==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hx7WYMxL4WLyMs5Q"
Content-Disposition: inline


--Hx7WYMxL4WLyMs5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:21AM +0200, Patrick Delaunay wrote:

> Add the new command 'env select' to force the persistent storage
> of environment, saved in gd->env_load_prio.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--Hx7WYMxL4WLyMs5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kkAgACgkQFHw5/5Y0
tyw4Xwv/SJqtCFkk1LhV2ZCCreAD2f7bXymf2CBRiCHOCrxXcPgxMhUxzSOeu7EU
WqG0lqE9xB8XiV9K7Dl49CYQCgHACE51JHzIpmZsfIfaVjZ0VGhybV930gZhysfb
VV5kugfD62wViTAMYBoR9FeLP3gC2HGiluftFZ7Qcm82aOTrIifaQFNDseSPUcQn
7pUGres3ypPxljeOAixOUgrlt8OHvoiKl2IVqygSn/7FKMaNwO5PDI8s53jBtLLW
Sgi2aj9OpbJjwM+aFc7XqpkacQzX/n1Hls0AYDrB9wJoIapHGqAOXRxIduFh88mB
301U9XKMwPfyQ+vEYOjxuZ99kPcyE6ozynusm/yLJr6qhAdm5AT96/mHhtn5tv8Y
h9fGUzkJlCn+MgHp80rYomoxTtCH1/S0/RosholQgtc7x+aReTFEJs/BlhQUX9tY
ERn06PGkxQh5VFWECdtdVdYOZGXa1GXbkJJYTZ7Enac8j5t7lJvUqr4d21NauqhG
IJq6J7nm
=l1YS
-----END PGP SIGNATURE-----

--Hx7WYMxL4WLyMs5Q--

--===============3337449291669026652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3337449291669026652==--
