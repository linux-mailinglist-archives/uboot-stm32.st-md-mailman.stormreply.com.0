Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF801BE5D1
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 20:05:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 891D9C36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2020 18:05:07 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34F39C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 18:05:06 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id a2so2624160oia.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 11:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dwf74ixEBOp5Cfp7I4CDPipw3bfIFvnJnVgAKFCL9jo=;
 b=mlyPr/Sq9kcvv/fCZB48jNceA8UazvNkIqlSmWoIYjy7eMyA/mpcKwt/e/FouDvLY4
 QgYR5wQEylKDH6aZetG3LIpYguaCWBgMecal5400M4Qf5V9P2OVQrrEuVnQ8XT6KGHlh
 7B3jj6zmzy1t7Yp7dDCDwU2oIuhCsM2hB5dZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dwf74ixEBOp5Cfp7I4CDPipw3bfIFvnJnVgAKFCL9jo=;
 b=p3t2aqUEjsnCNCTSws0svYeeiBxyQF74QJcAzQ9WelIvbT2rLz87+FxAjIlEjaGBzm
 zYeENp5J1i5SwDMRfwh3U2qDmoKULsNh2ko3i/plo3tuz93lWcC8caU4m9odxmXB/8qX
 /d2aKLIzH8gMW1X81Qfeph5D1fX0N66TweQSeHRsPa98zrm4+H2H004F+hArFuaUW+RK
 ODe+qGZH9RsOVB23WKkMmGa8MR7KABQw8KPROpu/bSRDeDw2tbd/N22TEYXFOooMAFto
 DftihpyyFJnc+XTk4v15XsUBlo2u1F1M7CqWSeLd1odMIHzorzfi1C4nxjjo0Pyqewas
 bd5Q==
X-Gm-Message-State: AGi0PuZR+MjXm0sSIOm3roeT3TllPfNq13h0GAd0+DdE5UClUfpTgSIX
 IQG7s4Mxta98bfBDNwBA/6fItJjC6Z1LPsO12vMPVw==
X-Google-Smtp-Source: APiQypJG+QaHSSLPLmBGK2YIxV5mULu/rs8TUEIolNnYe/F4C426HqjYIww4mQHAAwTaJzK3fGrouZJ3cD2/SehXBwU=
X-Received: by 2002:aca:bb83:: with SMTP id l125mr2497626oif.122.1588183499450; 
 Wed, 29 Apr 2020 11:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200429122031.31279-1-patrice.chotard@st.com>
 <20200429122031.31279-3-patrice.chotard@st.com>
In-Reply-To: <20200429122031.31279-3-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Apr 2020 12:04:42 -0600
Message-ID: <CAPnjgZ01vA_+i2MQPx4bxouuVbmci-R4z+NBMYY_NVY3chY3cQ@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 2/5] sandbox: phy: add driver_data for
	bind test cmd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, 29 Apr 2020 at 06:20, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> Add driver data to existing compatible string "sandbox,phy".
> Add an additional compatible string without driver_data
>
> This will verify that bind command parses, finds and passes the
> correct driver data to device_bind_with_driver_data() by using
> driver_data in the second sandbox_phy_ids table entry.
> In sandbox_phy_bind() a check is added to validate driver_data
> content.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
> Changes in v2: None
>
>  drivers/phy/sandbox-phy.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
