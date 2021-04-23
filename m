Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DE13696D7
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Apr 2021 18:24:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8C7EC57B5A;
	Fri, 23 Apr 2021 16:24:24 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BBDDC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 16:24:23 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id e13so40299352qkl.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8bweZdH+etICIWOJnPH+Z9JLneZ98MIr7YiRTyffjDE=;
 b=PI8NPfkca7OJbuloY6PJDBEM6d9ZF4rOurkeOO5w8bPqlsJyhXaHLi2FFOm9MZ+Fvf
 x1pV3j7ogIICGAhRQuHX6no3gqrcFggcETxVcNGTRrDIUmckkcHssQXqsWBXEHW296sO
 m7wi6bemMuPhJ4zr2N/bnFZicwCgYZALVgyG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8bweZdH+etICIWOJnPH+Z9JLneZ98MIr7YiRTyffjDE=;
 b=QwY7ouU/9jLD11RaUB3WCGSUjSVI62ASV+wJV1q/it7HZvLof0hKOt6JQeNdFotT+b
 S8/Ifu6hURQ8WpERWhnMDTizdyblr1zmvbeQZT4bpI+KpxQ3TnZw+CWloUua2LrZVnB3
 u+7G3JtAESGHK1Gj0EX3kok2ou+GD7lA6OmYcoZ89zr+McqvkNKORwQJPH+2+F9PAtAC
 6fj9ihB7gVB0DWHnkwR4M7hXaQ3HvyFl408/0ik25WwMZ1iNBp4f6shYlK8BETMqg5eM
 StrkhYjMP7BY8Aga2Oilnl7J9zT+ZfMOO5eIa+Apo217GyiTWNm+J073VKQaquT9+dob
 9XrQ==
X-Gm-Message-State: AOAM533AXZI4Ww4sJ1q0cG7tjeYatEkTBA59FLliZD7Oo1czfXJl2M/U
 fBZrl/hfMqRm6wB/xeXf2zMCFg==
X-Google-Smtp-Source: ABdhPJwF9wOFHJkZz9pPegMhnTmXQ7N3OmveWWxJ3KE3iTy9emIzSULL/ddeeNPHEJ+8Gs/yQkVXjA==
X-Received: by 2002:a37:a70b:: with SMTP id q11mr4766523qke.401.1619195062595; 
 Fri, 23 Apr 2021 09:24:22 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id u126sm4732345qkd.80.2021.04.23.09.24.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Apr 2021 09:24:21 -0700 (PDT)
Date: Fri, 23 Apr 2021 12:24:19 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210423162419.GT1310@bill-the-cat>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
 <20210310101622.v2.7.Icdf0b7e662fc65658e591ce0f692a5695f607256@changeid>
MIME-Version: 1.0
In-Reply-To: <20210310101622.v2.7.Icdf0b7e662fc65658e591ce0f692a5695f607256@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Stefan Roese <sr@denx.de>, Reuben Dowle <reubendowle0@gmail.com>,
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
 Masahiro Yamada <masahiroy@kernel.org>, Tero Kristo <t-kristo@ti.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Simon Glass <sjg@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Uboot-stm32] [PATCH v2 7/8] lmb: Add 2 config to define the
 max number of regions
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
Content-Type: multipart/mixed; boundary="===============1522923879194392554=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1522923879194392554==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IFZ6fFstIIKLfMoX"
Content-Disposition: inline


--IFZ6fFstIIKLfMoX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 10:16:31AM +0100, Patrick Delaunay wrote:

> Add 2 configs CONFIG_LMB_MEMORY_REGIONS and CONFIG_LMB_RESERVED_REGIONS
> to change independently the max number of the regions in lmb
> library.
>=20
> When CONFIG_LMB_USE_MAX_REGIONS=3Dy, move the lmb property arrays to
> struct lmb and manage the array size with the element 'max' of struct
> lmb_region; their are still allocated in stack.
>=20
> When CONFIG_LMB_USE_MAX_REGIONS=3Dn, keep the current location in
> struct lmb_region to allow compiler optimization.
>=20
> Increase CONFIG_LMB_RESERVED_REGIONS is useful to avoid lmb errors in
> bootm when the number of reserved regions (not adjacent) is reached:
> + 1 region for relocated U-Boot
> + 1 region for initrd
> + 1 region for relocated linux device tree
> + reserved memory regions present in Linux device tree.
>=20
> The current limit of 8 regions is reached with only 5 reserved regions
> in DT.
>=20
> see Linux kernel commit bf23c51f1f49 ("memblock: Move memblock arrays
> to static storage in memblock.c and make their size a variable")
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--IFZ6fFstIIKLfMoX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmCC9LMACgkQFHw5/5Y0
tyxHRQv+LHvp7I5c+n7M6kyEMpFDcC6PSgj79MnTFjMsssfGg8OvWFLPjBAh2t+x
vkY1TcnLl6Cu+LZCgnUa5yak7QK88D4SCCGQF3966dKaM0xJ1nD3M9GxVedVxJXo
/YR2KtW/g9syWACavBc8576hz05h+u0rKBul1kv7dytsVHbQPY83JDfCgmRg1Ztq
8SjonhWb/HEbVg04vuFYwRDxYmAwsyhKRvfI3gbYXxGWocWDsqpPAcxzpIAu3aqU
uZNhwA4EaxOy47cXkKJ5JOnaqn3Ew0CVjR3eff8fyqD4KNW9zciZYp1XN69c5Qmt
ITfzoyfM2rKFYL0Rk2whCaF8+sP7552IvfIhjhep1ZEGMSVoL/9do9BbPBfKbHpJ
zXg1PN1LUQvRQ1AXXTWqnAGxrAAiEg5F9Li4fDiC75ekNupHWQzSRfrmXasMpj0e
k4z3VT7NQnMVxDmMKS1w5I+0q30+RYvTYtIk5/3NLeza2gVSyxepo/RIisoAvxet
s4oxskwh
=n22U
-----END PGP SIGNATURE-----

--IFZ6fFstIIKLfMoX--

--===============1522923879194392554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1522923879194392554==--
