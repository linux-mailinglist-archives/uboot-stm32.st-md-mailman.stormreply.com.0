Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0643F363549
	for <lists+uboot-stm32@lfdr.de>; Sun, 18 Apr 2021 14:45:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A682CC57195;
	Sun, 18 Apr 2021 12:45:46 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F184C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Apr 2021 12:45:42 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id s5so24625530qkj.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Apr 2021 05:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tvoHPDEWtAGf4Ocpni6wSKcAl0yDl2yRbPzp2tyI5y4=;
 b=GvMugTs8f1yakFsrglKUwVOH+UU5vkVad6Av1X8IqjKJBR7RcZ3eaOrAtNBZIsRbX9
 Y1dZHZRxfI9FCWN2EgrA7WkR9GcbT8DcprtvzXr4P4Oyphy+CUw+WSeF05gnOHpN0qNd
 OXale+jECMVj2/eYsAGyf+xCOtXumHiFpFydc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tvoHPDEWtAGf4Ocpni6wSKcAl0yDl2yRbPzp2tyI5y4=;
 b=F03/In+mtiBvcpeOoXmBsWpVUryfn9q1PAew/fLRBjbetut41solE8bMwlNMnhdYGX
 PKugwSOyfXUfLpACimsR7/mwVejHV6ogy+oMPmCY/oRvxRt5bM0snKqx6gjCpebAy+s/
 k4jNMtnjFJBASz4isGaba0e5sz6FGz+/T5BK3Tjn6QWc1PXo1IedLBsN9P12VZXQG+FO
 caxqlSjvUNqh5xJ1TeJK7mdmNex4Mo8BYzHgqvQ2+x5Q2Bul0zj1++kuMiCiPjwOB3II
 IjIhp/wdYt3/dWXekEkGX1w7EpHcQBkeEbL8uz7sVJSFhSxIZrCp3cqwMEq5K9aYNyys
 AueQ==
X-Gm-Message-State: AOAM531FOW3/6k5dxASuoEJpyWUYfL+rhxD+ZdwObpxJGpbwvN6qzIOC
 xwSXyHOFDLKOxdEAfmFJsx19+A==
X-Google-Smtp-Source: ABdhPJzkUGZYaudkRM6bH6v6+8V9Rifh1ykl2knZKdcrN68iaBj+uWnnzFweyHJOSInpeNIVDQ85Eg==
X-Received: by 2002:a37:b807:: with SMTP id i7mr7588665qkf.126.1618749941621; 
 Sun, 18 Apr 2021 05:45:41 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id c29sm450024qtv.93.2021.04.18.05.45.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 18 Apr 2021 05:45:41 -0700 (PDT)
Date: Sun, 18 Apr 2021 08:45:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210418124539.GO1310@bill-the-cat>
References: <20210209104852.1293-1-patrick.delaunay@foss.st.com>
 <20210209114849.1.I4101043ff86264c22da77700b28bf231d66e49cb@changeid>
MIME-Version: 1.0
In-Reply-To: <20210209114849.1.I4101043ff86264c22da77700b28bf231d66e49cb@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] env: add ENV_ERASE_PTR macro
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
Content-Type: multipart/mixed; boundary="===============3609475409026739561=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3609475409026739561==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aNtGlLeLZ9vS9cg5"
Content-Disposition: inline


--aNtGlLeLZ9vS9cg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 11:48:50AM +0100, Patrick Delaunay wrote:

> Add ENV_ERASE_PTR macro to handle erase opts and remove the associated
> ifdef.
>=20
> This patch is a extension of previous commit 82b2f4135719 ("env_internal.=
h:
> add alternative ENV_SAVE_PTR macro").
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--aNtGlLeLZ9vS9cg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmB8KfIACgkQFHw5/5Y0
tyy5qQwAn5HE7MmeJDGARlQjw0l9nE9jrXELzJ4qvjsWdM8Oxo0Dk7PElH73jOi3
EQPjrNsBOGGXQ2LUxeq7wkxCJCvFPi95zmP0rET7BBY83DofsyVuMV7GuCUmaQcj
x4hMAkbalQ/V60gem32Mo+8c1Xt2LVZIpKFcSMMTp8YoGr9uAnDT3yAbc4OrPK8D
cv8RsEcTw8/bSi6Svpllojx+Lecfc24yzsuDdq98mMK4gH2lN9MLS1T50nzktKKQ
2HSdd/3JtqTXd96tNL4AZz4gVV2ZIIPZ5IQedEabq/8hfv5UsUbzn7uU9iYtBSTY
1u90AfivN7r7WNFI1YTCVpe2iJ4ReKWz4kl2Z8+mgJEkbljzEQzhPb7b0Yf5OhRK
XEfiRTDFZgvIC5gmjEK2BE6bHO2mFBIqA3HRAc+RP+cKJh+lS9JwhvWoTcOEQ/Tg
bSSHHVVWgx81NwnC7dL7+IfYZ50mPEN3YTkcyO5u2a+M17WYZnztlJ99I0cSFPLw
FdyhrtXo
=eSnq
-----END PGP SIGNATURE-----

--aNtGlLeLZ9vS9cg5--

--===============3609475409026739561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3609475409026739561==--
