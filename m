Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A12EC1AE740
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:08:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E0EDC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:08:36 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC82EC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:08:34 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l60so3206141qtd.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/Kb0E6o/XYgpZAYlLqwi5v1U7aAgBx0s2S777zaAcgw=;
 b=HyGtCoIy8dDOKr3lD3aTXG8fiXvqVZUpjiUuk/sRpJBVmxWI5BvftHFj58sFuFLQFy
 1Pe3X2kmPYuQvx/hqSMlf02JkKLkn2MrgbL+5OR3fhxAjKV4qGIb7Q6atbx2EDPEkJjG
 kGLqcpgeBDqrT+kLlIw4EObh+ZjXfFPi6IbXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/Kb0E6o/XYgpZAYlLqwi5v1U7aAgBx0s2S777zaAcgw=;
 b=mTm8w111cdlEY5muWDrkS7D5yON8rqsEzT/W24X6rxT5a6f56G1v/vvZylqscp8kYB
 Xj7m/nbB6ISh5Y++0ZMxSQx24gQ7wKfnwSuM3p5i6aqjiq7sRoGefs07ouikznAHMabR
 YNT0Qyqd0S+qQWGlTAxggXBgT8rEp6pbOGJmlO2lPvKvUNMqBASOuk062inldFLuCoRk
 wJ8S4oKTv7eUhLDxXv3/9zIDxAeyJJ6TwXSMquGaaHn5JXopp8HS/VfWfeFNhQ2Vtoxb
 YfHM4yito3h5C63eT3gMUq3VgFv/jgo4JXKTYoXHJ0mOjEt5a3eBmagx58QPrUw6wZCm
 jNzg==
X-Gm-Message-State: AGi0PuYa3nrQ8FwoEWLcAQ7NmHLvhbloKAsjowiE7BMPAF4zifE93m9r
 jJFbE1zMYBlSCyG5fa5Xfgyheg==
X-Google-Smtp-Source: APiQypKbUfXPNL4nhoX3QoPsrY9zg/G8HSYAIdWzjXm8T1bJv+OZQrg9ava12y/qYTggiQVgISeraA==
X-Received: by 2002:ac8:12cd:: with SMTP id b13mr5138612qtj.119.1587157713793; 
 Fri, 17 Apr 2020 14:08:33 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id m25sm1195889qkg.83.2020.04.17.14.08.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:08:32 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:08:30 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210830.GJ4555@bill-the-cat>
References: <20200310091505.24862-1-patrick.delaunay@st.com>
 <20200310091505.24862-2-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200310091505.24862-2-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Stephen Warren <swarren@nvidia.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ovidiu Panait <ovpanait@gmail.com>, Patrice Chotard <patrice.chotard@st.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/4] board_f.c: Ensure
	gd->new_bootstage alignment
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
Content-Type: multipart/mixed; boundary="===============3080468089702463327=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3080468089702463327==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xnH/NIbSm9ew9GxF"
Content-Disposition: inline


--xnH/NIbSm9ew9GxF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 10:15:02AM +0100, Patrick Delaunay wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>=20
> In reserve_bootstage(), in case size is odd, gd->new_bootstage
> is not aligned. In bootstage_relocate(), the platform hangs when
> getting access to data->record[i].name.
> To avoid this issue, make gd->new_bootstage 16 byte aligned.
>=20
> To ensure that new_bootstage is 16 byte aligned (at least needed for
> x86_64 and ARMv8) and new_bootstage starts down to get enough space,
> ALIGN_DOWN macro is used.
>=20
> Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
> Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--xnH/NIbSm9ew9GxF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGs4ACgkQFHw5/5Y0
tywVqQv9Edn5illAkkfr151IMg4PLb6NvqHNgK8ntYLBIdyXNzQ85hjzBUf5t7TM
dFr2QJXZi2If8ELbT7/Eu+k8W605EpVse5H+nCwn8dRidzzGBLoPQXiyQc3BkypT
2tCyjHaAw/EPehmU7Yhm7bpxbaJRDVbjgv4qUPmIll3q+a42BF271NdDxP7w1NNx
8/rh9mYFm3Opz7UG/Siqsk7LPy1leJwuZm+12xpT5Iz14mNTL70j3VtYgJtldJxr
i9e4/IZEFGXpGbJcj0myxqQqDFnfrU50TievgPU9cr7rBDe7iCyl6TEQpQlijq+Q
BgjAIEgJvjXxFNufs3zJtkVgGQcAI1TCgS2aUzbUdHBChj99N85URCVGCWiU8UCW
6FArCD+Viys8QlnJCkmowKCIkRnlNXLxa2EqU7cjzyKqNce3zhCWJbv4n5DWPrk3
cTIy9j27Niw3ij8no0Qi5rULqovFh/PgDdWMwsO6+y1sqB8E4HN4sE0nq52Aa2Sa
FK3puiXP
=q5SU
-----END PGP SIGNATURE-----

--xnH/NIbSm9ew9GxF--

--===============3080468089702463327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3080468089702463327==--
