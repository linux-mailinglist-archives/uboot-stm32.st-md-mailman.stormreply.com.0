Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7342E1B4A6E
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 18:27:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A6BAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 16:27:50 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0D7CC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 16:27:48 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id q2so1178358qvd.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 09:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b+BBptxnrpVPWZSKdZu6Oqyxg5TguLlA3Q3OtjMtF04=;
 b=t30eWFY6RMtzbRKB+YRmGktLtRKV8YtZ9Zt9IEhgpNjDWpJEieHET5Fk2MmF913j4r
 q7f1iCzKhM8ZHc7tNpwXPlbXXlC2LywxT8VVC+o1fqACLfxZjlkjh1LT2n+znZ6QFzOS
 Qmlx6KerrHrxzjgwyAKzbwe1t50xN9Jxfc9ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b+BBptxnrpVPWZSKdZu6Oqyxg5TguLlA3Q3OtjMtF04=;
 b=ou64fnGynRYAhqZQPnAvzNmuGsZd4mHpkXFY5k0aOBoH3o8n5516VUYXICXZ17bTLY
 GXq7gtBDiMyl88CEjm5AfxSC1X2uPPDnUy/1oiz5V3t6Lf3FLXVtU1W0VccTMyNzRMEl
 zHJ5t+NtMYi4DMhOr23F2guyujS14EFiFrx65T4bNVLJe9O+A81Mn9O90O8MNgJCA7Zh
 /v1MEw2GtLQyhql0qXl75dyzavhrmZgAZtHT4Uzi1/qz+lZYIC5Ll4k+JlERgtyjClia
 iNERuA5qvEoGFdBEuXb1+gsjkfJ5KwLL+syuwBTXMwIjn4g1QTFzIbeVUjAU/pxPF+8l
 xnJw==
X-Gm-Message-State: AGi0PuauBd0V5LIXJmMOl6zfcR5cyfQFLDLlCxh3yaVxRy6CfHUa/Xq7
 hUMcxP4kwC6vphrFG6XTfVkSaA==
X-Google-Smtp-Source: APiQypKwReICsVdDNJzdgdGiaBPfLp3YxXeW4+P+qTbVi45eKhdYYKkqExQtKi8e4lwXIE9B2ERB7A==
X-Received: by 2002:a0c:ec8f:: with SMTP id u15mr26335887qvo.102.1587572866746; 
 Wed, 22 Apr 2020 09:27:46 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-5991-4655-dc91-bdaa.inf6.spectrum.com.
 [2606:a000:1401:826f:5991:4655:dc91:bdaa])
 by smtp.gmail.com with ESMTPSA id k33sm1288776qtd.22.2020.04.22.09.27.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Apr 2020 09:27:45 -0700 (PDT)
Date: Wed, 22 Apr 2020 12:27:43 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <20200422162743.GA4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-2-patrick.delaunay@st.com>
 <20200417210548.GH4555@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20200417210548.GH4555@bill-the-cat>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 01/21] dm: pinctrl: convert
	pinctrl-single to livetree
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
Content-Type: multipart/mixed; boundary="===============8436378405920782663=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8436378405920782663==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cAMdxM7kFS4+ma4H"
Content-Disposition: inline


--cAMdxM7kFS4+ma4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2020 at 05:05:48PM -0400, Tom Rini wrote:
> On Mon, Jan 13, 2020 at 11:34:55AM +0100, Patrick Delaunay wrote:
>=20
> > Convert 'pinctrl-single' using livetree functions
> > - dev_read_prop
> > - dev_read_u32_default
> > - dev_read_u32_array
> > - dev_read_bool
> > - dev_read_addr
> > and get rid of DECLARE_GLOBAL_DATA_PTR.
> >=20
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>=20
> Applied to u-boot/master, thanks!

Now that I've setup my AM65x board, this commit is breaking boot there
and I don't have any idea why.  I don't get any sort of output on either
core (this platform takes am65x_evm_r5 for the SPL and am65x_evm_a53 for
the main core).

--=20
Tom

--cAMdxM7kFS4+ma4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6gcHwACgkQFHw5/5Y0
tyxulwv+J3fjdezMvGwd4pWHfAcxNom9VTO+wDwb2IHcLc4z1fhLxXjdxbcxqoum
Nb82Szcq9D7bPOLPW7ZO4ISWsEp89WrrQ1b1XIEGvsW4mDZmceugGeeN26V7yXQ8
rqpBR+LkMoNFZak9jAydWN6XaEcfnGqIowJ+KwyHJIwbnfX2mVrg7e4r4vzTYYDV
Nrb1bZIO52/PGtubCIn4DWGyUiYdSoe0Hv2Z9pvoWY495LiBsQu20At64EtV/ggm
FqV96w208hG2hgZ5tUijLXdSN72+krPClRuuCVEIe/wjhPjWkvrF2chHKz32DIGx
TOSWXnEjxAW7wse+jOd5ls+Y6M1Bky68F8kL1pDrUXfuCGr6RCaYBBjU4I7Ud3Wj
Tbj9ZtKkFHtQ8y6I1iDfl+erezd6kwKVB9UP48Y70byVMc+GBBya1TeRdXkXpCgU
rg7fdOCEfhiMffQyIJwk2yDO+gwkECfA/J+rbDsigzNSS9GG4vSlZuO9pCwTqO0u
L5V5CVK9
=fSYT
-----END PGP SIGNATURE-----

--cAMdxM7kFS4+ma4H--

--===============8436378405920782663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8436378405920782663==--
