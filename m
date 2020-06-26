Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B003B20BAB5
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2020 22:55:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A231C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2020 20:55:20 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2504C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 20:55:18 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id d12so5130399qvn.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 13:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qhHB7ObqdlRtm3t9DxkFHGk4+/P+JzeWeWeVuB99RcQ=;
 b=MLGrwPXeurdgoexlnYfXtrFGYAVtozKLnr6D31Qo/1t9g7SyUY7agmKXgBmBHlV1sf
 id9Mb+0JC6n0TSgJwoYm2emcvV1G5GkRUtf1/G/i9qhZr75bsgi3IyFQl1+RqgIjtQt1
 tk3wVuRMQ3jipB4wiRhuRWZI5RvDVdMn50xuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qhHB7ObqdlRtm3t9DxkFHGk4+/P+JzeWeWeVuB99RcQ=;
 b=MEC+5QzAcn1Qww6oCeody1oLAMQxG2wm5PvY7TvdNI7OOJCln7ERciYGD7pWtxPNQs
 7DRerCUYT6NeOohqgL+y8SP0HwKliCJ4I3560VtmcmmxHP/JSvToy+i5DeJ6WXF0/dtU
 o418t4gxEzjn9a8I/Sa8Awu9LBHP3l7hseuV/sKmUx71Pzv5kHxPiRV93x3luIPLCPlJ
 gcZJ233pClO2uyO/zNCNA8e5x9AMmn9oTUvYR0p0mO0fHTC5se/Ix67HKuxBVAFYw18k
 TpPj2YgsQZ7oDZgg0OR30mEU10UDBvQjMJW24LCS5kbPR+j7imRLf5QIE7OF854hkpck
 +dzQ==
X-Gm-Message-State: AOAM530U93ZsyG45dPE3TUOHyyOLxOUR7avEnalvYrko+HoFh6Q5I1lQ
 uVzZ9fTMM2ZKs6D3JUEfEbWgsw==
X-Google-Smtp-Source: ABdhPJxK2dky5X6vpMEIRShRnBrldblLca0ddmJhLjwlm5rSMgNE/O5hA6D+Lc4i24ffaZjz9Ud+tg==
X-Received: by 2002:a05:6214:3f3:: with SMTP id
 cf19mr4980592qvb.94.1593204917734; 
 Fri, 26 Jun 2020 13:55:17 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-bd3e-bf60-4b70-2dd4.inf6.spectrum.com.
 [2606:a000:1401:8080:bd3e:bf60:4b70:2dd4])
 by smtp.gmail.com with ESMTPSA id b186sm6466788qkd.28.2020.06.26.13.55.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Jun 2020 13:55:17 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:55:15 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200626205515.GH8432@bill-the-cat>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
 <20200625075958.9868-6-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200625075958.9868-6-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v3 05/14] env: nowhere: add .load ops
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
Content-Type: multipart/mixed; boundary="===============6538157279254621209=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6538157279254621209==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ilsi/0vOxQ+fn9lZ"
Content-Disposition: inline


--Ilsi/0vOxQ+fn9lZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 09:59:49AM +0200, Patrick Delaunay wrote:

> Add the ops .load for nowhere ENV backend to load the
> default environment.
>=20
> This ops is needed for the command 'env load'
>=20
>=20
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--Ilsi/0vOxQ+fn9lZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl72YLIACgkQFHw5/5Y0
tyyhTwv/YbKI7dcDPjRniHABxkuWdT2ilVnb6rdY04P0CKYF1vcOPShgXJR2VBot
zu+AfOlBQepNsiAP0B8/yzK0YFHFTtr+Ic4CJQu/V8aOO8bfV8sY29ZvaQAuOO4b
7seWBXN/xZKBJSRLv7Ck4iImW6e+BQZwWPTU6Lkpagl76hCrREpIUa12i6aaTetl
kWO6knMfWJvyxeVoGGhYqjw9qFkCpik7AnOjP3Ut6uFwPEJORAf0ri/gPNr0PdJp
fmGPmrbRScTi71Xj4wP1FulahNPSLHlTVOOjQ/5NgSk1ee9DKdgoS9WWlOkrtzcb
55acC3Tr3FzYs2SNSxlnQuMjg9m+TQmrVMR8xkE2jsZkfJpoeVC5zxpczrIiYMBo
+9NJZeXNPn0JogjRfakUNWmyCneuOSm8OSSoe4sQbgPzn6/pE0SA6I0O4tuaMxEr
Q4hP0fUkS/3DeUsusqfEzKPuz9KAa5wXr8W11CNyRFMHh9Q2Va8p2C5HrBt7cqyO
zEzfqEPz
=tfXF
-----END PGP SIGNATURE-----

--Ilsi/0vOxQ+fn9lZ--

--===============6538157279254621209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6538157279254621209==--
