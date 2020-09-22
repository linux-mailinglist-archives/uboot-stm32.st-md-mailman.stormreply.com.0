Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D8B2744FD
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Sep 2020 17:08:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 963CEC32EB3;
	Tue, 22 Sep 2020 15:08:04 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E0B2C32EB1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 15:08:03 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n10so15809172qtv.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 08:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZytP71Bisou6CcvZ4S4TH9OLVB2xGTdTlnzqn/RDkNc=;
 b=iM5yeveYtxB0Z8ivjYXCeJrEXOT+ztkWi/mbVT6O2ROkk0C3KzgcgXVFTkSJm/wNZB
 bHRWPXzELyz2Kz8IKT+kywauhVscWi2Cwq0LAWDV8My1UtpLfjYe7exnsRC/kJzaKkX+
 Fnfnopn5J3duZGjFuJsh3K8a6595yWizAKe0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZytP71Bisou6CcvZ4S4TH9OLVB2xGTdTlnzqn/RDkNc=;
 b=WUMo7KmuxmgDxKfTtfZCLnnJBhfKPKAHqw3ChCyruMr63Hf9JXsVudOqqspkxt5DV9
 nJxJXKFsIGU6I4KqZxg8MIujcaRaB+alAAzp08dahefLvwyG5e/c00YArgAPak+Lwpke
 S3fDpErVbrm2Xe8y//HpzJAUaSg4qLPkrfegl0pGHL/z+oN+UGI0mWWjwV2YkRqeHyH3
 5rxxnqF6ViebbrzyQ07+sfw47p9zM3D5Llpm0FmX/BuiWeUaZ6U99GMpVojrdR7cr2EP
 d6FiCEPKnEITs5MZPGn2jKV3lAoZwNsdYn21squ7mPBPwf7Lp+TcsGbPfH5KkKCW/f1G
 /jUw==
X-Gm-Message-State: AOAM533r/C7ko+w812Q49Udncc+f0Ik0Fw3uzBMKFo0cDHbFZ0AIOvBK
 hIyePi4tHpkj+SRBjj734xDgPA==
X-Google-Smtp-Source: ABdhPJzgKhNXd3T1bELFDC11H9In64peDBsiEQuC1SbfIzgCcfnXPz63ki4T3qJWNm1zVCioQmk3KQ==
X-Received: by 2002:ac8:7b2b:: with SMTP id l11mr4894341qtu.126.1600787281630; 
 Tue, 22 Sep 2020 08:08:01 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-a44d-5ac0-e6e7-4c04.inf6.spectrum.com.
 [2606:a000:1401:8ebe:a44d:5ac0:e6e7:4c04])
 by smtp.gmail.com with ESMTPSA id m24sm12423941qtn.59.2020.09.22.08.08.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 22 Sep 2020 08:08:00 -0700 (PDT)
Date: Tue, 22 Sep 2020 11:07:58 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200922150758.GF14816@bill-the-cat>
References: <20200703153646.28533-1-patrick.delaunay@st.com>
 <20200703153646.28533-5-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200703153646.28533-5-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Michal Suchanek <msuchanek@suse.de>
Subject: Re: [Uboot-stm32] [PATCH v3 4/7] usb: host: ehci-hcd: change trace
 level for phy errors managed by uclass
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
Content-Type: multipart/mixed; boundary="===============4193819806723041195=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4193819806723041195==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ORQ7wZOtrZMMlBRp"
Content-Disposition: inline


--ORQ7wZOtrZMMlBRp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2020 at 05:36:43PM +0200, Patrick Delaunay wrote:

> As the error message is now displayed by generic phy functions,
> the pr_err can be change to pr_debug.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/next, thanks!

--=20
Tom

--ORQ7wZOtrZMMlBRp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl9qE04ACgkQFHw5/5Y0
tyz1Lwv/R0aDgeuOeSGujZseLADC+jI8DO1ysqHM/MNCwx2s25BnM4EzJWCGKS4S
upwEpjb6pdDzsLJC3HftIuZn2MvdBNeQg/O2bjENzxi3Xx4bnHBRrnZLRydtz9R4
vikb/DyvL//q6YhcBzVWO5lQxZ3pqfS3dtPGb0NvphPe30okuOA49aDen4naFehk
JcRD79vPjlfTbn8n9wv6hG+1OhQZ5wl6UnuRt2jPp2tvFVrYn/2B6eGejQ+wQeoG
TLQ0o1Tkv/+h+25gRboU4BeSupeQF2i5Ub5oagK7EWnBa0Pre2TEkwrnJ84WQ/FS
KUBVhQL5bw1o6kDej88TFMIOql6NC+3hcKe8RH59qDCIHeWnh24u/nxNEeY74mMA
uwxaZj+qhH5Mm0M9Xgq/FL1LCH1DIsz6Eklo7q9Z1ePKsnnU5EbJTnvrHlpxgYJC
n/Jy2rmW5SGgkGuMUoPTCew0GYjTY6U9YMeFA3KMbM/OtwtuEnfCuiKmtllhRYfa
pX183tbi
=Kr26
-----END PGP SIGNATURE-----

--ORQ7wZOtrZMMlBRp--

--===============4193819806723041195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4193819806723041195==--
