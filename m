Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F92C423327
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Oct 2021 00:02:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28FC0C5AB80;
	Tue,  5 Oct 2021 22:02:38 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9EB6C5AB7F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 22:02:36 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id l13so630211qtv.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Oct 2021 15:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0v+Es+hPysxkfM6fhs0mbGvwQYoDzp0NOmyHR+Ayi8w=;
 b=MTuY5tLR/E/oF8Kb4e+P1jdfjCd0CXiABdiTFwGD2l7iWoakIVSS2+xQz5uL/IU9YW
 u7TAxk1/F522EgaOfkQovphf6CzqjvCb8+PEh5cbIwTXiMDS1bAhGgHWbKJKhbaHnvYw
 2r6d34FGawhsqIhq0KL/Q88cyDiIvzQ8zvZ1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0v+Es+hPysxkfM6fhs0mbGvwQYoDzp0NOmyHR+Ayi8w=;
 b=kgKJ3dMTfTkxwVQ2kw/45CKixiiEkX/owX0NJpSVvwZWlNfbf3parK1dmKX3KoSnUj
 3gmuk5mb2sYB7tQs2Y49I09/QBfnYzzTYFgwMsmZcxgPTYw4TPnqFAkxFScngFQ2HaGt
 LuarpZV0xvYWWpeMeSnaSW4TUmwM9zCYZHL4cQPNWU1ScDFjBZlC+w/JfV3Uu3FA7JPA
 SdIFGAXTn90NU9PbVRS/Vqp/aWRi8nmGihBSwYIDHmQkvxDop5OAr94r+fPcYr1EFn6B
 +rrqL1YoHPzefzKttuTYTQIVbM/CIHzMFYZVCq68h4MoPDEG0R1EpQRiA+LryeODFvyK
 ISpA==
X-Gm-Message-State: AOAM531HpLv1k3e0dRtRzHI58Mq5Wka+Xq5DwjjqZjVWHbqDhTNA9r2q
 qfl3Q9iZ0DR3V6yi9kDYV+4Saw==
X-Google-Smtp-Source: ABdhPJxoTlgq6LHdxQhZXeVkDFOWwbQcMh4fJbOfbS6AaYtCetr8xJaTvfd/LkYS5pwp2Rjywf7YrA==
X-Received: by 2002:ac8:7d91:: with SMTP id c17mr22948582qtd.40.1633471356068; 
 Tue, 05 Oct 2021 15:02:36 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-acff-2c31-c6db-812f.res6.spectrum.com.
 [2603:6081:7b01:cbda:acff:2c31:c6db:812f])
 by smtp.gmail.com with ESMTPSA id s20sm10357958qkj.116.2021.10.05.15.02.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 05 Oct 2021 15:02:35 -0700 (PDT)
Date: Tue, 5 Oct 2021 18:02:33 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211005220233.GM31748@bill-the-cat>
References: <20210920182717.1.I218b17a86b820ee611e9dd643c1fb40e2b480257@changeid>
MIME-Version: 1.0
In-Reply-To: <20210920182717.1.I218b17a86b820ee611e9dd643c1fb40e2b480257@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Nandor Han <nandor.han@vaisala.com>
Subject: Re: [Uboot-stm32] [PATCH] reboot-mode: migrate uclass to livetree
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
Content-Type: multipart/mixed; boundary="===============5787736110848062884=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5787736110848062884==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DLFWJW30b8/EguhV"
Content-Disposition: inline


--DLFWJW30b8/EguhV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 06:27:20PM +0200, Patrick Delaunay wrote:

> Use dev_ function to support a live tree.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--DLFWJW30b8/EguhV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGyBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFcy3kACgkQFHw5/5Y0
tywNFAv2IYNG/nRjJ0199IAWPVlj8oFCPw2LK4UvqEQoDUkhxBTEciYoaruGm0Ia
7c47Itngztp+/L2XLiSQgL/TouDrEGpvtpGDrQVEs3qHDX2wfpAilAg0lvNSsOAI
PWD4yI/gj6b34Z6YqS8HZXYWNsyAzJKGYcMxOpiqs/hxfEw+1Ks6XHyEA6LO8wKv
1RLA+1gNRWv0Olh0EevWzA0Q5YQV53o3zBlV8UpX57xiKt+4shRMKfJ8HSvAwoSa
E86xXxlOdkxIBh4QjmDURgvhOeEQJIIkh2tmrXGTqk9RCfnfoRDgeFAT0ob2flD1
yt6V9xZMjnzTbZwPU2CguNe8l01CyGHBqhslQfx0I8AuOOY1TsX13ipbAMOCpV8s
ExwgmdBwm1YYWazRIVulpB5o0o3VZiM63am78oHpYKEXu2ZLwR+WQEdpKbh4Kbp6
GqiViJGtWDazBU+/n6qBE2lVVo0VStoOq5DieiSQoObA0waxcP7uVwu3Qt1rZexv
4fmAtP8=
=vQxl
-----END PGP SIGNATURE-----

--DLFWJW30b8/EguhV--

--===============5787736110848062884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5787736110848062884==--
