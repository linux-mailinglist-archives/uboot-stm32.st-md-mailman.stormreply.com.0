Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECF21AE729
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:06:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 375E0C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:06:29 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95F13C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:06:27 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id q73so1649081qvq.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NI24cO/TxgVvafC3rWQz4okA4Eh49sYZv3WuE7ELkYc=;
 b=X5wqpxmJepHBa/NgVlw5YF+avDZ4NtDngMoKBOUdKEg++JMa238+DQ9w10RDyp0saU
 BQs6S/fJ+DmV2n2JryzMHfYSxFJBIqavnO5J6op+if66EYVKlUh3L4QUYTFNF9kGmjn9
 sqERfhKMBWrRTz6Ue2ZK7KSlkA7mHHlOm6MtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NI24cO/TxgVvafC3rWQz4okA4Eh49sYZv3WuE7ELkYc=;
 b=l5OxbfGctrHtxROT+5HaaBY1DeQjHUqG1c96uqfG+VzCwB036P92L9jYgllIX+Z3o+
 Bic9mmLh/QBASxi2CU/uRo2IBWJeG2SAqnbWM3NY3W2+q9WUMKx4vCn+I1CWjGomJC4V
 O0M9Fig7qYZSpDxAUfoYhSu8GmRDaj0xiF6x81QrwjXp/Kn6khCP1HzbFnmOSOfOYF/7
 hZgQou3kgsfLaPf9VMhLMnV+hZwmicFDz2IZdHdTv4suKrcuq89I0UbKVdYkCmT8HkNi
 WE3vcRWgev0j4TQGsFqxMAiieLHfhSvkiTSZvEvjI8sOUHgXk7XfxCwabZpXrEmpFYRT
 QUZA==
X-Gm-Message-State: AGi0PuYqUiwQ58DmzdbeD8x0gYNLF0ct+YSbxZ6RHblO7AJO8lOmfl/X
 I6mBYY4qSjGuDl4NtnD/myX+tMOHXcg=
X-Google-Smtp-Source: APiQypJu/XJIokZj1F1TOtHsEMTuZCg0sZ1wRhmP58tXl4VVfWwaXgu2PdOTgaVPwH4a2M5ZgQwhfA==
X-Received: by 2002:a05:6214:227:: with SMTP id
 j7mr4804672qvt.85.1587157586464; 
 Fri, 17 Apr 2020 14:06:26 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id o67sm5415460qkc.2.2020.04.17.14.06.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:06:25 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:06:23 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210623.GN4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-8-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-8-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 07/21] gpio: add gpio descriptor
	initialization helper
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
Content-Type: multipart/mixed; boundary="===============5091376763122909308=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5091376763122909308==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PMULwz+zIGJzpDN9"
Content-Disposition: inline


--PMULwz+zIGJzpDN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:01AM +0100, Patrick Delaunay wrote:

> Add a helper function gpio_desc_init() to initialize the gpio descriptor;
> with this function the flags will be always set to 0.
>=20
> It wasn't the case before this patch in dm_gpio_lookup_name.
>=20
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--PMULwz+zIGJzpDN9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGk8ACgkQFHw5/5Y0
tyyHbwv/dVSiGntSStHzJTADAOJvPGZCBJ+wXoOIebQgej53machNTLX4J9Z8EM8
0VTsSSpjD+dTbE+5nwaj9IhxN46+2ITiqM94UWid+KfATqFmdXWtdl9JKQQAdJ8E
Q7ycQsA82SuLGlQXbsJETr6MH+5ct6WADSzeACwmSGkDDAj4buxnAzGq2zq0EOMk
EJ9GqUxRkim3dzXDgA16n3xrql0ZFDxW0CeBsEnfrJHUHM0SkGw6nUCJrhZSyutX
XbRfOSGaohJSs0IE85B/qRGBSNbVaxf/YMosd8FUAxLjFwV4lZ3Hl1lOIJWRDfdD
lx869VYWeLwzrQ0hQfyA6d6lF4BKPsYGF4wzeO+qUvcoJfvSK2CUAiyFTIbmG+s+
3GXhL4vrLnNmsvrAiaDZmkPwEWQ5XY48dS+rahBB1FXByMR1OpEeHBHZjfuudJAu
b5plAM2eK5JzEiNZGwnxdp+HsquVTuyf5Mo6s/7Wt5cdLjvkUpHZaI17ObZPnlZe
bhRA6co0
=OzEy
-----END PGP SIGNATURE-----

--PMULwz+zIGJzpDN9--

--===============5091376763122909308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5091376763122909308==--
