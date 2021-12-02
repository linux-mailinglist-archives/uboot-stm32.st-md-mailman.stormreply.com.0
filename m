Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7180466354
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Dec 2021 13:14:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F42EC5F1D5;
	Thu,  2 Dec 2021 12:14:58 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A670CC5F1D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Dec 2021 12:14:56 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id t83so34367761qke.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Dec 2021 04:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J1jdiKFwnzHaVz0WZSsdbXS8h6rmrfCY0i3JxFs0/2w=;
 b=CDoRUopXsM+t1394MNc0d/UWVs51oY7ZLeE3aRhXCeMOx8c4P9SJJTMeW1AAhdfbnR
 elmuFT5uM9gvraUImSSJOafWE0qhlTkEL2FrqwHl7j0soQiudfA2F9Ssm0oIkS+bXnm1
 /VXhS1gMee3uQ28SXkc3fOzDSUwx0otTUq1Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J1jdiKFwnzHaVz0WZSsdbXS8h6rmrfCY0i3JxFs0/2w=;
 b=7LiBhAJ8Wkd03dhkaaFB/7rrdL80R1kX2dx8kkDqTq0iO9Zd7eQgw8DA9OPwqPK5N2
 NGlKwVzeeNmlSvfK7Rn/CEDswCIpP5rqqNwZinhk89LsiAd5daVhbdhuq1u+PxhsgdC4
 N60cvtvkoCdQjJmq4YshvVjeBrFSgUhtQW98frPKlfHA3yMVjuL2Ls3EVmME4UCdmRFg
 JMLr+ux3Md+dstSUq+4aNtFdpR38Uz9/XEjiaatQi3/ysxrM+Vg83wtdXmm+eCWyZ7fj
 odRVJJXvK5Pf5YAEj/7Fs12qVJWhV4kwrsVTQsMDm/jBQfuMM/VEi746N9AzHwZJDovM
 qENw==
X-Gm-Message-State: AOAM533AvEUg8QuhaJbOfVyFhcrWmhTeIcylMtE1ZMIk1sY80POevIG0
 YHcpGjNePJcBWBxLRPoWTHSWTg==
X-Google-Smtp-Source: ABdhPJyUGqxFSCbEMLbZOu1vDti5bxim/8DWw1XQg9JKbRxpL6ocq5f8Cfn3Y8RG7SE7/KrSenJFLw==
X-Received: by 2002:a37:94c2:: with SMTP id
 w185mr11333346qkd.666.1638447295725; 
 Thu, 02 Dec 2021 04:14:55 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-c825-72b9-4e49-4490.res6.spectrum.com.
 [2603:6081:7b01:cbda:c825:72b9:4e49:4490])
 by smtp.gmail.com with ESMTPSA id y18sm1639337qtx.19.2021.12.02.04.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 04:14:55 -0800 (PST)
Date: Thu, 2 Dec 2021 07:14:53 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211202121453.GR1220664@bill-the-cat>
References: <20211119090227.126391-1-patrick.delaunay@foss.st.com>
 <20211119100218.RESEND.2.Ie857134e9935cc3476949ba179f4b79c348ec671@changeid>
MIME-Version: 1.0
In-Reply-To: <20211119100218.RESEND.2.Ie857134e9935cc3476949ba179f4b79c348ec671@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [RESEND PATCH 2/2] dm: add debug message when
 failed to select the default pinctrl
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
Content-Type: multipart/mixed; boundary="===============5878970106578016589=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5878970106578016589==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9pS2hy4/DrI8BQlq"
Content-Disposition: inline


--9pS2hy4/DrI8BQlq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 10:02:27AM +0100, Patrick Delaunay wrote:

> Add a message on probe in driver model core when the default
> pinctrl selection failed.
>=20
> This message is displayed only when the pinctrl API is
> implemented, i.e. when result is not ENOSYS.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/next, thanks!

--=20
Tom

--9pS2hy4/DrI8BQlq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmGouL0ACgkQFHw5/5Y0
tyxfzQwAtv/IJ+8bTGdFNLSjU4Vbh1D11P7t+ywOTvqTCAt0svpe7JkWuwxVj1r5
hQtl8foahTfjP7fAQsJwNlgefWY5K0Uh6kpZ+kxnNjzJMHfVxyKpUxQQcfW9IheD
RbtTJXLxP2EQ6Vr/eeSMykrWvrC3jUMxkmv7cNT92L3q3VFS53omTq71hGcEwSFv
yCQhq1PL90qe0d9OZnA4JRK9QF+rh+MLp/v1OYE5QpXoD4ltJwqgDLwVG9mM1Wa1
Xt1uG69Hj2p5BEnB6KvZyNt1yJqdMxK1qobVpFTWF4S77Js2MMYLT3nour3X/une
t7u5huiq0HLcfVYLwchUDeahIBy5Vf/ApfuD0le8SUpqccPXdNkbTJRIjG+HPrvf
PaTfzzecfTXfBNs10SGBh+9CfZPNDo1fOsgC3HQyV+Brq6fR6z4yVf9Hu/X7opv5
Akvlje29nXrOuvY3vK4hMaMiCClnYfhzuC4lr5WiGMXpcxoxcXk0nzwkKbRTVWB2
Rc87w/dn
=UIUd
-----END PGP SIGNATURE-----

--9pS2hy4/DrI8BQlq--

--===============5878970106578016589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5878970106578016589==--
