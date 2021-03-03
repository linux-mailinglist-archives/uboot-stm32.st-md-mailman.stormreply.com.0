Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1C632BA1F
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 Mar 2021 20:09:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCC71C57B62;
	Wed,  3 Mar 2021 19:09:26 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3540C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 19:09:25 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id h9so8569127qtq.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 11:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=B8bY0wQpBV+oXc/ClvYYEVgUUyipqsMYMa+wiLyHt2E=;
 b=lXVldsaGeV0vPSTeIswkU+awDfHL/EM9X0HCOKaMkYwR6Pde7boT5vHvJQC9/dXVqK
 WtOoWkofPlOKrvL6dlYQ/z9/3+Dkfv+8udOEEDWE+IvRG67rq8elQgfxdERPbDNImGo2
 vr6aqdNmKVKZ2IRx7QY1en6MQd6AxOtkyuAAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B8bY0wQpBV+oXc/ClvYYEVgUUyipqsMYMa+wiLyHt2E=;
 b=JMR5f8s015947uSX38yIUh3CXzM81qM6bGh7AfYyn4ioAw46KReENY59rzK1LjvAje
 0Gog5V9w3OsUvYscWhsiviHuZfPD8B/CoDHm2dKQHgpDZmOg33iYJ9VSB6t9zUKMZxqb
 IgdXY8fhapOMRx2gY3+hFAG0bXeVNTLMApcAjbPxI9tKYGqxOegOH/hFMcoB0Wo6FKM0
 l+Wfusb+RuX/dYf6lGOV57r9qmdlv6ZdVqTuf1DM2o9MIiMlGIBJKtkGPJ9VZDoKkDXC
 9JbzYZpzmu4sRtmFlQekAIREIasFMF2OuDaDgnvlmVskCN+UGpSX+2IvITpa82TZRQXJ
 4vGw==
X-Gm-Message-State: AOAM531MpuVW6WWROfowTDLomG8qX5Kn+8WxZfpXhECl4LaUZqVL5dPR
 LmRbxAvxMbPV8Cw0dTOludgSGA==
X-Google-Smtp-Source: ABdhPJyIEdcdPR/ltf+K4Cmdvhil3rIWEdgJLhmy5Z/vZlrwJSFCrYydLtDU8zOtnTrRR56dzCP/Sg==
X-Received: by 2002:ac8:4796:: with SMTP id k22mr694870qtq.236.1614798564751; 
 Wed, 03 Mar 2021 11:09:24 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b07-927a-451a-3a99-8647-33ef.res6.spectrum.com.
 [2603:6081:7b07:927a:451a:3a99:8647:33ef])
 by smtp.gmail.com with ESMTPSA id d14sm7915015qkg.33.2021.03.03.11.09.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 03 Mar 2021 11:09:24 -0800 (PST)
Date: Wed, 3 Mar 2021 14:09:22 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210303190922.GS1310@bill-the-cat>
References: <20210205125339.24721-1-patrick.delaunay@foss.st.com>
 <20210205135332.6.I70595b1999985446f2156eb37b3d973ba489c82c@changeid>
MIME-Version: 1.0
In-Reply-To: <20210205135332.6.I70595b1999985446f2156eb37b3d973ba489c82c@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Lokesh Vutla <lokeshvutla@ti.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 6/8] arm: omap2: remove arm_init_domains
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
Content-Type: multipart/mixed; boundary="===============4436495072812326297=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4436495072812326297==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6zn93sY2JrH9m7VZ"
Content-Disposition: inline


--6zn93sY2JrH9m7VZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 01:53:37PM +0100, Patrick Delaunay wrote:

> Remove the arm_init_domains and the DACR update, as it is now done
> in ARMv7 CP15 level.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--6zn93sY2JrH9m7VZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmA/3uIACgkQFHw5/5Y0
tyxBwgv/e8b32kAKapOMLJmZDr4lwSWHBWvDBLQ+cVpJMOWKg5qQ9c2TZUEaV/4g
EnW50WFzD1xepHWItc1qb/6A+ggHJVGvA7nopvKMenm7A436eUGPpwJsr+XH3Hkf
tzS15OghiA/gSR9HkN41raQ+3DK9bMbrW0o4LPpNGoAbkd/0mzgGOvxURS5fI0l0
tJqOHR/a7iJT8VzWjtBTimJCl+BjUG3xorEpaWyPp6MkuqG6tTbMnUuolxVcrtEI
gfmn4eyq885SgT6Raz9uDLCiDLAyhO8GiZAZWXnGzvlkeUmd52LaeY//Q9Mj8vC6
6RpwmIAXiSzbDzANL9mB4N/JHDsSvREdibKNFAN1ZYaSSpF6mEC7HehY65R1PnUj
OYleeYsKJt7WeBt0lwZTJMGSgI0PU+R6JYmNHwX+vjJ/BAofAgo1S9GJaFSdD+u/
zy2+IYyqcRZnrhvx6yyIwLvoW+OzRG/Z79tRdh//8bUsKsVSsIBV7bjYiKzpUofG
f/6SSVpY
=MSRS
-----END PGP SIGNATURE-----

--6zn93sY2JrH9m7VZ--

--===============4436495072812326297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4436495072812326297==--
