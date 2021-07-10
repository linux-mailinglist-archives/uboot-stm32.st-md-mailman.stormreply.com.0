Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8853C2C48
	for <lists+uboot-stm32@lfdr.de>; Sat, 10 Jul 2021 03:08:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A357C57B53;
	Sat, 10 Jul 2021 01:08:27 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C48E3CFAC5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jul 2021 01:08:24 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id g12so8890540qtb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Jul 2021 18:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AWNugfHmU52sOe8hUW7XGrRjDTqOCjpt1zEFnPQeqCg=;
 b=WFKFbbC6rZjVG+R7IWLdwXT8Dlq6gWhkn8k4TPGqmBsU+lbx3+mnYCd2BR9DlF/RYd
 6xVs29rFWWSxeVFxRvZzZefABUsHZpOCVzBf58WpS0LLad0aKSCMQrsytzZheh6K4EPx
 sOVKo6+RLW1VOIQDgBmUWN2/YfzDz0+FLNvPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AWNugfHmU52sOe8hUW7XGrRjDTqOCjpt1zEFnPQeqCg=;
 b=Ihka3rzc5TCm3OOLSdc2F+24uTxe5IQMPmhNHYZ+sMT0WBnFGlvZDxqtty9iG9kTmp
 Eh9rKBTksmW85gT+giEeCkBP1aIQCy22ceawFvzkE1bzfrzbT4ZuZJUZMN64SOATsvrY
 VMdkZORWdnLWELtoymiK4Em+xb8DL0dJIz/R9wYnhFOMBkrp1unke0QnpPzBBq7hO/jg
 fRdL9i/CKRONeUIdAvmr+L2hMMvwOEPIndOdXhLEEC3Z5cwm2u62/xdvDwnHMhkwL0it
 xvtMT4iPjVZj44fABxWQFhPKQwaUrlOj1ykvgSehis4kTGPYNCejcRSXHucfpmeIXMQG
 HWHA==
X-Gm-Message-State: AOAM532rhAn3ZkiQ5f5V3u4DD2l+YAqyCziRR8yQLHjBI/RmWBQ4C5HK
 hCDEZdAAx3xs+jpBkO6drDzplA==
X-Google-Smtp-Source: ABdhPJyYUSEqqAZ//fm9gmdiSS7ZCUHE0bESCA7Ql7NhgGW83X6SgWYwWl7OYPYba963IpSpkvVR+Q==
X-Received: by 2002:ac8:605a:: with SMTP id k26mr6937002qtm.65.1625879303607; 
 Fri, 09 Jul 2021 18:08:23 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-a5c2-d52d-ba41-be23.res6.spectrum.com.
 [2603:6081:7b01:cbda:a5c2:d52d:ba41:be23])
 by smtp.gmail.com with ESMTPSA id t62sm3237471qkc.26.2021.07.09.18.08.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 09 Jul 2021 18:08:23 -0700 (PDT)
Date: Fri, 9 Jul 2021 21:08:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20210710010820.GL9516@bill-the-cat>
References: <20210224124843.12648-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20210224124843.12648-1-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Alexey Brodkin <alexey.brodkin@synopsys.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Andy Fleming <afleming@gmail.com>, Stefan Roese <sr@denx.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Angelo Dureghello <angelo@sysam.it>, Masahiro Yamada <masahiroy@kernel.org>,
 Macpaul Lin <macpaul@andestech.com>, Thomas Chou <thomas@wytron.com.tw>,
 Scott McNutt <smcnutt@psyent.com>, Wolfgang Denk <wd@denx.de>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Alison Wang <alison.wang@nxp.com>,
 Michal Simek <monstr@monstr.eu>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Patrice Chotard <patrice.chotard@st.com>,
 Mario Six <mario.six@gdsys.cc>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] arch: cache: cp15: Add
 mmu_set_region_dcache_behaviour() when SYS_DCACHE_OFF is enable
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
Content-Type: multipart/mixed; boundary="===============0809722474621082370=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0809722474621082370==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IEzoES8k7owYxfAa"
Content-Disposition: inline


--IEzoES8k7owYxfAa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 01:48:42PM +0100, Patrice Chotard wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>=20
> Fix following compilation issue when SYS_DCACHE_OFF is enable:
> drivers/misc/scmi_agent.c:128: undefined reference to `mmu_set_region_dca=
che_behaviour'
>=20
> when SYS_DCACHE_OFF is enable, mmu_set_region_dcache_behaviour() must be
> defined.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--IEzoES8k7owYxfAa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmDo8wQACgkQFHw5/5Y0
tyyYDQwAqDjt7SRTnt9SRilYtRGDR3eFrzLaNus52BR4H0d+LEbrZO5SXF5mRtrB
p549Q47SVr3FlU8+GbK7fdjNlWj+w6pj/HD7adKQfJzUpdKVPTrenkJMooVBE8oN
4ustN4jfxJCeFNKRhWKbDR/f+kH1e3wPd7g5AUUYC6janXYQFGb/5aa8UdDmmy67
8tusSjY4WwzRrq243UuSB/TFdcvaKNSGsEeLoM9yliA/p+L2tdRJU+592omzjM3h
8WPM/wxurPL89ipDKKF3OrQcqm+IpT3xmJDlauxtPeF6vZG96pgS2Tatvova9/vn
iFN8IjtkW1ZsZnZcipdgOnGzShshrLdWTAFzHRZXioHVF4SAXEwWFqgxStYRJmg/
2EbyWtSGi1LnW18wXK0RHofrVspfV//bK4TGCOckTBrJ5zeNGzQSIRXlNUzU5fhY
Hdn/7xoTCofqZ7j3ATILSHRmqBm079TmL4Mn4l1lXBC0cdMaSwdghfz8p0F9WCtl
E2+X3/0P
=qKKa
-----END PGP SIGNATURE-----

--IEzoES8k7owYxfAa--

--===============0809722474621082370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0809722474621082370==--
