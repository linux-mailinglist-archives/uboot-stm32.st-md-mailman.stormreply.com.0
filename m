Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 511356678EB
	for <lists+uboot-stm32@lfdr.de>; Thu, 12 Jan 2023 16:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10A6EC69049;
	Thu, 12 Jan 2023 15:18:38 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24D3FC69048
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 15:18:36 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id qb7so12898440qvb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 07:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gUcUvWmrYDw9m2xCQk5CDKV21qGvK/66zs/G7zGdeQg=;
 b=PqQ/gxiH6mZAqVqNLcgM4C8IPGIiGR+XPbvkCyZhxPOMvbGNfyVsqHqVojsPfhqz2f
 YWmK/WA0gR8xRJ4MlK7s1bLOeoQwx6JgXRaP23dsNxnteLSJrWRHV5IqZjcP9nx5Bd/g
 6LgnhEvFVNCzGGzqx+icjVMWBKLolK1Zc/OXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gUcUvWmrYDw9m2xCQk5CDKV21qGvK/66zs/G7zGdeQg=;
 b=c05Rhuq+8k9euqFcRHJ6ziokBjtYUhbqgHfuzejYeL0lM0OSQ2jBPomZCpCvxuVmqO
 eNj/Nk55gI4BTSY7uBh0RdbHAzKjm44Stz5B5ZopMkGdlxdHqh4MRlX4mvXVXgkg1Y1B
 /54YPGGNAx09N2n6eaqyJTJX4IhmYq1Gohw/RKNOVoYsZTRtFqsiwzPB0xKW8REK4NJU
 5j0SOGW0v4ks/kZTKIqa8OJpOV1WkD776Dnx0QZOckM0HExTZWlxs3neasNyW5jq5H6k
 lkMhXXPJFFgTIkntcVkmmQQiQqm/JZ7w4oSfTFYaDtUPFnnMY8hRKBDnzhDmBeW5qHJd
 IYHg==
X-Gm-Message-State: AFqh2krr/USay3m8+CPIKKFNGYga33jwDqNX1Qyv+HA4sm18L2FGx88F
 56AH/XqghLsU35QHrJMfwY7jbQ==
X-Google-Smtp-Source: AMrXdXsSxWnUqKl8tc+06VJfc2TGl29FWQZ4Pum3mj9MYCkfgEl3jhWrPunvWvcCrxsLYE1jVOgC2g==
X-Received: by 2002:a0c:d68d:0:b0:521:dc66:8a95 with SMTP id
 k13-20020a0cd68d000000b00521dc668a95mr99493508qvi.32.1673536715170; 
 Thu, 12 Jan 2023 07:18:35 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-38c4-8177-7e9d-a94f.res6.spectrum.com.
 [2603:6081:7b00:6400:38c4:8177:7e9d:a94f])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a37f917000000b006fc2b672950sm10922342qkj.37.2023.01.12.07.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 07:18:34 -0800 (PST)
Date: Thu, 12 Jan 2023 10:18:32 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230112151832.GE3787616@bill-the-cat>
References: <20221215101547.1.Ic4654626494193d6dd4788d14fda0aae447783a5@changeid>
MIME-Version: 1.0
In-Reply-To: <20221215101547.1.Ic4654626494193d6dd4788d14fda0aae447783a5@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Simon Glass <sjg@chromium.org>,
 Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] fastboot: remove #ifdef CONFIG when it is
	possible
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
Content-Type: multipart/mixed; boundary="===============1758331958109247445=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1758331958109247445==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U5oZ2PziUXwhxgGJ"
Content-Disposition: inline


--U5oZ2PziUXwhxgGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2022 at 10:15:50AM +0100, Patrick Delaunay wrote:

> Much of the fastboot code predates the introduction of Kconfig and
> has quite a few #ifdefs in it which is unnecessary now that we can use
> IS_ENABLED() et al.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Reviewed-by: Sean Anderson <sean.anderson@seco.com>
> Tested-by: Mattijs Korpershoek <mkorpershoek@baylibre.com> # on vim3l

Applied to u-boot/master, thanks!

--=20
Tom

--U5oZ2PziUXwhxgGJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPAJMgACgkQFHw5/5Y0
tyynfAv/frb52EWvH6MqeFYCLVO0le/bwc1p/8wczc7TbGc4Sngh+vM7lLIxIqF/
3WjqUJg0cbDGoOVgcvZteK/iijFSiNejIxoMYFe2QAmcc40luCR4Vg+iRhysx7SV
/JojgkVgT59lyMQ4bhrgHqKivAt6PuaOBpAQWL1wOcrYOfuhkmA9b5cg/3EpZNsS
HLQ2fx3pI/fctw5nM/Xv6mAAarWst0w9SY/hgAndVunz/P+Ad/NxwaFqrtmK5HIh
QgkkYUiXjvtDtv/ddl6YwvrwdapD8FCAqq4fmhSpyb0usGboIT1HuHu0MWBSLZul
fHklpwFFttVRsILXztLQVJ9eGn2Z1abS57FPvDiEK5Dy4T7PRwyJYT6fJVT+oo5o
o1CqBkgGO0C+3hhK16U1nMuzXzczIVuLg+qSldcvbv4Eu5+WPjTIoVtpmv8O2d06
Uhw7xptff26uYOP6k+o2XyL/o98v3cuwrFwy9YnEb8x7ry6TGzFzxTXjfvcQCZiw
Te/BURsT
=vxfB
-----END PGP SIGNATURE-----

--U5oZ2PziUXwhxgGJ--

--===============1758331958109247445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1758331958109247445==--
