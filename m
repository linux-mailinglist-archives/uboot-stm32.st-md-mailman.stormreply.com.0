Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A67C0B3CA
	for <lists+uboot-stm32@lfdr.de>; Sat, 27 Apr 2019 16:48:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9615EC24023
	for <lists+uboot-stm32@lfdr.de>; Sat, 27 Apr 2019 14:48:00 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68254C24021
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2019 14:47:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c12so8632731wrt.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Apr 2019 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EWunzwYtRWdJ0FgQAykMi0R9vPxbRzTbzNSaHRDE/98=;
 b=uPFQhtK/8LwAybuQ2P9VrVmUgJnRhO3s1WPsMM31YCLzmwyI/BEq9ic284FRPIfnDx
 Sy4PsoCPgFk2TbKAFU8NHsQ5OMf6MOcdrPdBI07GinSnh35WGcsZF/OMntc5Wgx5k7QZ
 6Mxaaz3CKug0VQZNtnYLHUGSqikvJzrESNCmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EWunzwYtRWdJ0FgQAykMi0R9vPxbRzTbzNSaHRDE/98=;
 b=a6vx6c9Bz1OmIya7i3BIOud9mHhCdHEMNr0GvoDAGd5Qv6yZSHez7t7fczZve8D306
 cWLQOgr+i5GcJLfhk0oqhpAogRGZndwueNp9xocd8KuzEztMcSjsSDIdcyxDpnVPZAov
 n/tR2SBSD2RP98kq6Bxi5boan1mT1+Nx9YYHCGsXfyMgPvz7Ss8J81umsrFy1Hh8ymVe
 g0YM+RbaJL6qH2DYHibiS248hDu7vcgdzIIkyRDQW8vF4gIQdRoLQ0QsGbCtW92WNeFQ
 qVqSar22oSGjDRHvufYG4rPVFCCBTYS2CC2t8NVLA9St9zUiE6UMNuSHBYBcGhggHmbn
 8cTg==
X-Gm-Message-State: APjAAAVNtDaYwaTBYaDFuZPRVxQGxVPlyWiHJygm36985Rkg9lUJEFzK
 0rM0j6VEIewcqMbLQDhkFJXXYw==
X-Google-Smtp-Source: APXvYqwc1o95MUydD7ELyX5yG6WAYyCxslWiO2q6S6G0MkiqiembpPmJwdvuT2PJ+/OnaVQH6gUKKw==
X-Received: by 2002:a5d:69c7:: with SMTP id s7mr33191149wrw.71.1556376479006; 
 Sat, 27 Apr 2019 07:47:59 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
 [65.184.141.147])
 by smtp.gmail.com with ESMTPSA id c2sm26137157wrr.13.2019.04.27.07.47.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Apr 2019 07:47:57 -0700 (PDT)
Date: Sat, 27 Apr 2019 10:47:54 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20190427144754.GY31207@bill-the-cat>
References: <1555600582-29790-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <1555600582-29790-1-git-send-email-patrick.delaunay@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [U-Boot] sysreset: syscon: remove POWER reset
	cause
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
Content-Type: multipart/mixed; boundary="===============0387732191935618202=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0387732191935618202==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lgYgvhCDN3+WDmok"
Content-Disposition: inline


--lgYgvhCDN3+WDmok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2019 at 05:16:21PM +0200, Patrick Delaunay wrote:

> The sysreset of 'POWER' type is a PMIC reset defined as
> 'remove and restore power'.
> So normally only COLD/WARN is supported by sysreset_syscon.
>=20
> This modification allows to use the function sysreset_walk(SYSRESET_POWER)
> when it is supported by PMIC driver (see example in stpmic1).
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--lgYgvhCDN3+WDmok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcxGuaAAoJEIf59jXTHXZSEJkQAJ6s5TtRYXJdZbZHg0qbjHN6
ki833MyYGlQnzsuJwesMhNWrGiGOk8OUZZNEoS4qpufjU9q3AZ+gUGk5B5yjRyPC
Pl5f0kFw9YM8ydcM3KDYIn/YmG56wdCcXz/RQPFro+xxJQ3xJo8cWWxY20UHrA8f
UBZXjeF1NwG+etCdbiJIKD0a3m4ciTv6i+7zKmHn572u9Xe7ecjOIrwQFU3/Q0Z0
cwo3oYbgV6oBGerILjFzCzxFw1iDkQpYUC+cUuuhqDpVNw8NXhLmVXM/a1eEyDyL
0s+PkALcpyGHcLfukLy4j4rmAK7C6rZ2MRQRo58AVCyEG5k4/6sMujIhhXExQGfN
UaB8L4ajWnRMcjWvP0XBOFAGWb5wm1RI10PzZCN4TL2Oug6YC1sWLPX/t3pjJuXA
z9Fr9RBNR/XyNXGzAFUG9uAONyxw9y8/w7hoGA/25f+2kdZYehx+MDcsaVSbec+g
1OLDHUDLnD1U5yECJDKpldnslb7c4tvGXwlJsBZtdMVw3JI7hWVmk+fdLVftC358
gk0zufqfK9F2jiWnC/q4TtdxEN/ltNb2P6T3EYNUaUEHx6wHR8IW5oy6S/giPLje
LQCTF/eLkSi0cfGWjYTgwCV4T2bva4S5DL+0tJW2GUpE5FTmmH2B3HO1IQYwduM/
7DmXOKOpok4oWB/sgf+o
=VlVf
-----END PGP SIGNATURE-----

--lgYgvhCDN3+WDmok--

--===============0387732191935618202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0387732191935618202==--
