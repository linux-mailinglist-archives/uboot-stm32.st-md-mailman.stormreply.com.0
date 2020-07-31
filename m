Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5810234D48
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:42:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FFD5C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:42:07 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00FE5C36B33
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:42:05 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id b25so24105059qto.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=N4H9fNKObeiqhtNasXoF8rAiAWLHRVTd1dbaEqfqT/Y=;
 b=bfi0bqIBuccEJlEHVeQRkF8oWB+NCaUhGzc2PX+KDMjEfaSrTyFaBpYj7jHFxP+Wvj
 RS2/ocmAQ6ryn0J8HrRntOwCINDBXkuolud+Q8jqN1/88G93mNbmCfXgiAASOKm8lGXJ
 XzpZPG70IBEmi30Hd8SJ+XKzLnuCGFPM047xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=N4H9fNKObeiqhtNasXoF8rAiAWLHRVTd1dbaEqfqT/Y=;
 b=PeHQdqxryHEVKyz5E+MgS5bK4OcDWqej42ADUsWDHRcM40Al7CEA05nqz20fQL7AgM
 Ys6mcU0wDsmbx118+kOsb2xKzXOnRmxLot/+ZU5efGBS2P71dLlOxGYrS6m0pEmSy04M
 O39RJiDCIG5tJnDIez5IeOT0F9a41i5DylD9B5tIiqwCOrF6RSGWO/CU04GHp3V6iyWD
 IJlX7nI86TPM+UvJom4CV5dZbvttb3T5sHoye0jYpb/bM6jQHfTs1tIk9RJXjmM6+iso
 EPx/1Q96O3uWLZvE7jzInyXGB0Khv/y86pXYp81fL99OAz0KCKhllr6iey7OhWcYNGzD
 z57w==
X-Gm-Message-State: AOAM533Eryt/2omylLNUuDs3JR3ffdcGIWCGuBP7uqfooL7jfzFLfzTq
 JEK3CfhwBEuTmUhODjsagHigtWHYLEqJ3Q==
X-Google-Smtp-Source: ABdhPJz93ZBLDodMVc28PIxGRF+mbXySZt6oBkxiYE6dsvKeVAFbOiVgy1l0ZW47QJbiYFos1cHmgw==
X-Received: by 2002:ac8:431a:: with SMTP id z26mr5789207qtm.298.1596231723977; 
 Fri, 31 Jul 2020 14:42:03 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id l68sm10158536qkd.62.2020.07.31.14.42.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:42:03 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:42:01 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214201.GI6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-15-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-15-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>, Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [PATCH v4 14/14] test: sandbox: add test for
	erase command
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
Content-Type: multipart/mixed; boundary="===============2680413697726236275=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2680413697726236275==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xDpVnDuQvJgs1tNg"
Content-Disposition: inline


--xDpVnDuQvJgs1tNg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:27AM +0200, Patrick Delaunay wrote:

> Add test for the erase command tested on ENV in EXT4.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--xDpVnDuQvJgs1tNg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kkCkACgkQFHw5/5Y0
tyyrFQv/fTSLbtHJmFjjzgraHiV77aGk1283Aq+zrptX014Vlw6273VqG384gAnf
XElDwwlbRiz/QX/GM6ATO8WCKV6rnUl+cPSld16b0/K/JtQQ72/+KTkWOHbLdn6G
Vi00fhFFJMEFy+1kVfI9xu13eGXah33P+OGmeZ3E5LXFR2fl06ajBd7gCooKT5nw
jbHwCHeICLk7wYUZqLyIwp8rsIgq6SrNH7KQQtt+rxbe05ZD3QE9TcPPt/pYxMNr
OMRH6YHOt4m4EItHCn1yX3FSLLErebo+8v8fgQ8P6hFnr85YzaQ1eF9joJdhFVgd
53QYurAuidpy/RSU7n6yX4Y+soegQyJAuGc2VT71viYMCJD1xa41MT1IrY2sOkXt
a3xo7yGtV4dQvQGcTES3zM/zMsVohJuBac1BrtGPeXcG7s/s8y6yuCQ09DyMm6H5
EmPruLPwsPz/Le/yU3zjraljoqD9sp4ZRqu1qODEsS63QSeY9RURyQSxGL7KrRNl
SyJermfr
=aPB7
-----END PGP SIGNATURE-----

--xDpVnDuQvJgs1tNg--

--===============2680413697726236275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2680413697726236275==--
