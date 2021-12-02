Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9586F466352
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Dec 2021 13:14:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DD18C5F1D4;
	Thu,  2 Dec 2021 12:14:47 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C71EFC5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Dec 2021 12:14:45 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id p3so17482275qvj.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Dec 2021 04:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PGrrZ9jSHVp8Kxi8YEDNoWgD8+wGUkE0lzSJFlrCb24=;
 b=YGSTVa6xrWpjBrgMoiNCAt7B0VyYS6302bhKgzS7Q47ZHOQfu0YTBg8CmHpfBnT3U2
 d1czcbNUwBhML9Rd01vbDlvDJoZTwFw2jvzsKspSNVRgD8nBObwZzu4gRNuFoRVZrvWR
 dSlk+rQ1gnNL62miu0nZy0TuuZZHb2RerdNts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PGrrZ9jSHVp8Kxi8YEDNoWgD8+wGUkE0lzSJFlrCb24=;
 b=pk2g8oaYkvQ1qhM8M8/Fn/driC34FTSTBrp/b1PoBFMkk2k4/aEPn18Y4AHUTnItKR
 /RMTxtFBCBE9OdHJvgBqFgbUm0F/FjSWGel6/PKb9+d1AfnkGvh+d4zRs1I4nZ20xI9m
 ZVcJqHhed1ixO8WtWv2CnNCC9JVQQeTNKUI+KptoLBIlnhpwLTvjXq6fYXz/FCSZJ3LP
 LZ939sBojwrZYYt9HU5dsUxOHpFrncHzVr6sMyrbRxFk6qo7sYUhXwN61cYFLRWQZfpl
 u4WIUrhJeEZMhq99iNSIWrTJtg2kiL539WwU3B4qPoDLSxzUCn8hAGTuk0gXhqi4enpJ
 8R+g==
X-Gm-Message-State: AOAM531PoMIHztGYuLsC8hNT4IS1+g9t2wC7hLvUttejLH2lcN+aGjTj
 FmQK6Kmv8ntq7UMQPY6IYcgyuw==
X-Google-Smtp-Source: ABdhPJzV61vwkt+giBiHQ69tTlRlxoiC9/u0Pq3oOGb7D4FWOo8p6pfrzkmNEKsfY6i0S7cbdrhwHA==
X-Received: by 2002:a05:6214:d0e:: with SMTP id
 14mr12281921qvh.26.1638447284901; 
 Thu, 02 Dec 2021 04:14:44 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-c825-72b9-4e49-4490.res6.spectrum.com.
 [2603:6081:7b01:cbda:c825:72b9:4e49:4490])
 by smtp.gmail.com with ESMTPSA id o1sm1483557qtw.1.2021.12.02.04.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 04:14:44 -0800 (PST)
Date: Thu, 2 Dec 2021 07:14:42 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211202121442.GP1220664@bill-the-cat>
References: <20211108102034.1.I5bb33aa84680ff548976f04f18cafca7ebb0ec91@changeid>
 <20211108102034.2.I275896d33cc3ef96ef439f13eda5cc6a8f9665c3@changeid>
MIME-Version: 1.0
In-Reply-To: <20211108102034.2.I275896d33cc3ef96ef439f13eda5cc6a8f9665c3@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] scripts: remove CONFIG_IS_ENABLED and
 CONFIG_VAL in config_whitelist.txt
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
Content-Type: multipart/mixed; boundary="===============3883910496620844611=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3883910496620844611==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3rMDlCEgcaHQQFB+"
Content-Disposition: inline


--3rMDlCEgcaHQQFB+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 08, 2021 at 10:21:22AM +0100, Patrick Delaunay wrote:

> The helper macro CONFIG_IS_ENABLED and CONFIG_VAL are not real
> configurations and they are no more present in u-boot.cfg so they can
> be removed in config_whitelist.txt.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Acked-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/next, thanks!

--=20
Tom

--3rMDlCEgcaHQQFB+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGouLIACgkQFHw5/5Y0
tyzf9wwAm4iRB55cnRUW6F0qtbjHzqyu8iq1ScaVK/bTR9oCGX8ySBpcjLXLY0IM
Q1s7pAZakM7JpPmr4svAMueuWfavxUsDVjFn0KVYSNekoY9BKpS0TQUFydAO2Igq
OsDi9DI/a6G6PFUX2xqC5MjbfJn0scIpRXXNVH8uzeSlp8mPhK1cH5CjEPzmPD2f
tx9xkHZTJFp+Sed3sZSXpiVYzsbn6hW36hTJrxEabHWqBdDYRJWgRGX11j2/mhjH
YVWkHDtp7ZycxLj6HpRUu55LbuoRseJbRt0oU+xXeJYJzQmNMhyOgkmk1TRsbyGw
dJvT5o8c+1wVhN1Ho9jJy/CNZsWknUj7LWj7zNP27ai8l+hSDvHCpFAhiKRMdZog
ZfvXHU27BaZ34w4Gv/ExGmrFbEYdrtA5B8JX6Q2ba7zZgzzDJllM9sQZ6qy05T+s
KDiMpqPJRau6BYG5DiACaUBf5E46IQAqdmiAiUs+0g6mdN1jqaUEb9tyuSE8/kTm
IR5jHlRi
=Vo8S
-----END PGP SIGNATURE-----

--3rMDlCEgcaHQQFB+--

--===============3883910496620844611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3883910496620844611==--
