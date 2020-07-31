Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7F234D38
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:40:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DCE6C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:40:01 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 482B6C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:39:58 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id s23so24074371qtq.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YNQKdMo4XvOJrguxb2K7lLXNbDmqHjzMyRa1Ojv3mhA=;
 b=p6nCBq+qTuB+I3wI/YFcGBCrmoeT5nU7Oe4aUq3YxKFp1hSM0L3Rbbzch+2q/4MeXy
 TcIW8qKHRsb6kc4z1uiZq0jrXEqJaOvuli0LcPNU7f9bzhvQ1TG/SHYJaMRZxpYM94Pk
 pFuPbCc0ajvXkX4pfdW4ikLVrVs1xyrRCGm1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YNQKdMo4XvOJrguxb2K7lLXNbDmqHjzMyRa1Ojv3mhA=;
 b=JnydVo4OQUyvorGtg2exon70b5UxB1y/ke+9cXTG+6oLZ4yfYO7FumYGPUUY1pDHi6
 Td0fnJ7luyVcsRRIUROjfo5hNW6Xu4W4kj565CY4sPt0crmMDQkt5mJnhFqzZHKPymuZ
 Jmj5S7lS84CXru+tkcNOQ9bittie2yCq85mM+ultM4JCpe58doIv0phjVvV+wfi+WSUq
 8vlD0X+y+Qr45P3YEOZzcdyTiAnSS+49xNkRNa3dVWGRutz2J4gkflVVdstxONY9aIHD
 y91uhVuZfix6tz4QNFQ1s79c7Mo1aXzO/jRS1ee0GCtG73iT8E/bpGA8HsKSf+rLls+H
 qRrQ==
X-Gm-Message-State: AOAM5322i9EuiHUzJhUJ5miagdttCphGBfnkFn05YCzwA9moP4Gi+y0g
 5eZiGJWU5v2Ers78zijiIVJ5zQ==
X-Google-Smtp-Source: ABdhPJx23Y6fMIYByMw7gvnESqw6tWfYppD9osATI1+ie8iOEcmWlvVjqIPeFUmMFjR7JJRNo9kxQw==
X-Received: by 2002:ac8:4741:: with SMTP id k1mr5869578qtp.41.1596231597129;
 Fri, 31 Jul 2020 14:39:57 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id s5sm9530298qke.120.2020.07.31.14.39.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:39:56 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:39:54 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731213954.GO6965@bill-the-cat>
References: <20200615145217.16864-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200615145217.16864-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Patrice Chotard <patrice.chotard@st.com>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH] env: add prototypes for weak
	function
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
Content-Type: multipart/mixed; boundary="===============7019187955000973969=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7019187955000973969==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FiJIb0ZaFabftQLn"
Content-Disposition: inline


--FiJIb0ZaFabftQLn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 04:52:17PM +0200, Patrick Delaunay wrote:

> This patch adds prototypes for several weak functions:
> - env_ext4_get_intf
> - env_ext4_get_dev_part
> - env_get_location
>=20
> It solves the following warnings when compiling with W=3D1
> on stm32mp1 board:
>=20
> board/st/stm32mp1/stm32mp1.c:849:19: warning: no previous prototype for '=
env_get_location' [-Wmissing-prototypes]
>  enum env_location env_get_location(enum env_operation op, int prio)
>                    ^~~~~~~~~~~~~~~~
> board/st/stm32mp1/stm32mp1.c:876:13: warning: no previous prototype for '=
env_ext4_get_intf' [-Wmissing-prototypes]
>  const char *env_ext4_get_intf(void)
>              ^~~~~~~~~~~~~~~~~
> board/st/stm32mp1/stm32mp1.c:889:13: warning: no previous prototype for '=
env_ext4_get_dev_part' [-Wmissing-prototypes]
>  const char *env_ext4_get_dev_part(void)
>              ^~~~~~~~~~~~~~~~~~~~~
>=20
> Commit-note
> Hi,
>=20
> I resend this patch, rebased on master without modification
> http://patchwork.ozlabs.org/project/uboot/list/?series=3D155601
>=20
> Regards
>=20
> Patrick
>=20
> END
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--FiJIb0ZaFabftQLn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kj6kACgkQFHw5/5Y0
tyzUsgv/af5Da8EBIQRvi1fv/enYihQjzcRXdarkrfWpxXLmaOyUaSHgBou2w32Z
9I1yVS33ozE+Y3iyKGT9NVTi7LlDH8Lv0jA3IcouzAGvs/4cOd+MvJJ08PG94ITN
w7pxxlh4H+RsnxItd3iQ4QrWg9aB/derUdDE2t5NXMOhLuCxABX+lweVzFKEtkZD
6/DAFuk03g4+w2T1PGCG7XHcdZuxTLDynWbiEurxBJ5NFgHDq17bh/dsYYO/pTJB
dEtTXgjBr3tdiojLWR6ZVuBIhclsqEDlXg9dV+OuD9zmzlpTGmu75J2evcP1c5oP
XkWJ6t8Wn0X9gatfcI/ldTpDrUT98mB4kdAootLK+ztA0vOEmOcPVPcfNk6KUQr/
O6/6SNsMVTqUvQlPN/Q4nvFgS5u2cg0FPWMVNtEclnKLFB/7PaZvRDfpD+K6NUqg
m1T4XAg9QS+RgB4K035hf2uMQ3eibaG91kiWTYFVE/fXPS38wFVNphKKghoA8pCh
bF9pBXhi
=QXSW
-----END PGP SIGNATURE-----

--FiJIb0ZaFabftQLn--

--===============7019187955000973969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7019187955000973969==--
