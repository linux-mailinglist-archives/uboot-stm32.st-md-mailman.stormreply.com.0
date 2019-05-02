Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA811148E
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 09:51:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E0C8C0B790
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 07:51:03 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74F05C0B78F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 07:51:01 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id n8so639508plp.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2019 00:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xqNgwzMEJVw8jbDUUycB6E6NX/RZo0A6i4v+sv6ndX4=;
 b=uNCV7sg55aGzPIoL132zTx4ud+0G6fGQKcvApdvmct6wuQJQlqlnVcU1n2E2t0sMK5
 ycZfRWkJE+cvRYcH+XauwWktKFgEom/OmkTuzmW8K2PcWLjRAYwqX1DGf+7N7NENZc5B
 cpF8QCcLikcDZgCILJXEv51Zl3RS3ReALAnQaCdc+Qn39CTUs3gFdahbSmZpognyY5x+
 0Rswe1e2ZARB7eCzkPn2xZEIeANFaBTy6XDXKDFklr6GdV5VP3cel7ZJF7JrfIJTq6jL
 9W4ERWjEvpnwunE9J35GPVGiTN3JNcI5NOF3LIU7X6MWXtcKYMF5OGWcOEMQpR6nM7H/
 nkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xqNgwzMEJVw8jbDUUycB6E6NX/RZo0A6i4v+sv6ndX4=;
 b=d0hUg/16ox5YNwmKHhpMjj8o1b0TPH8O7hcg5k09Aw3t1HmPLwR/JjmjRtXwZKqNyk
 dufvEbK1PI436X42PKStzJesOgdZ7sC4cRXnbLgFJzz8xwWGDCl7/sooy+gekm6ttxq7
 hFJka4+eDxzhq7/OGdbdULeAz7hd48KfzGYcusXaY8aUbFewJnATTLjW6/hC3Xn2mJlC
 +Nhry08N4Q9HK2rVeUxUejPbSd3tYI5RhZ71icLTtbuW5cItspG1Zxa7SoAE1hg6fNg/
 aXL/3F7aTFCR+e3XFGIbB9nLE2k8ap8KygESsgnP2iPz7dvR23s++YyWuZboLj1Tuvq3
 S6GQ==
X-Gm-Message-State: APjAAAU4bViuqYb/bp4XvK1Jbmic58Q2RGmexoqQuHW4IzQlPJjGnj9S
 QfdNALhcG5sIr40lubrYtHFn
X-Google-Smtp-Source: APXvYqxJyAMMKdpSMBA0JPeMusiWYybV4coyjlMVzzqxNX8e0ef8/kj+J/7vWvnINOkcWj/MZXRbBw==
X-Received: by 2002:a17:902:e683:: with SMTP id
 cn3mr2223141plb.115.1556783459763; 
 Thu, 02 May 2019 00:50:59 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6284:a261:31df:f367:f70b:ed86])
 by smtp.gmail.com with ESMTPSA id k4sm4484369pgh.27.2019.05.02.00.50.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 May 2019 00:50:58 -0700 (PDT)
Date: Thu, 2 May 2019 13:20:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Patrice CHOTARD <patrice.chotard@st.com>
Message-ID: <20190502075051.GA7425@Mani-XPS-13-9360>
References: <20190429120359.23332-1-manivannan.sadhasivam@linaro.org>
 <4dbe0cb4-f73b-f7c2-13fe-462e62a88016@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4dbe0cb4-f73b-f7c2-13fe-462e62a88016@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "trini@konsulko.com" <trini@konsulko.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 0/3] Add Avenger96 board support
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

Hi Patrick,

On Thu, May 02, 2019 at 07:27:14AM +0000, Patrice CHOTARD wrote:
> Hi Manivannan
> 
> On 4/29/19 2:03 PM, Manivannan Sadhasivam wrote:
> > Hello,
> > 
> > This patchset adds board support for Avenger96, a 96Boards Consumer
> > Edition board from Arrow Electronics. This board is based on the
> > STM32MP1 MPU and the board support is added under st boards since
> > there are no significance changes required to boot u-boot on this
> > board other than the dts.
> > 
> > More information about this board can be found in 96Boards website:
> > https://www.96boards.org/product/avenger96/
> > 
> > PS: I only managed to boot u-boot as SSBL with TF-A as FSBL. U-boot
> > SPL way of booting is not working.
> 
> What are the symptoms ?
> 

It was my bad. Just found that I missed few `u-boot,dm-pre-reloc` properties
in DTS!

Will send the next version of the patchset incorporating those changes.

Thanks,
Mani

> Patrice
> 
> > 
> > Thanks,
> > Mani
> > 
> > Manivannan Sadhasivam (3):
> >   arm: dts: stm32mp157: Add missing pinctrl definitions
> >   board: stm32mp1: Add Avenger96 board support
> >   arm: mach-stm32mp: Add newline to the MAC error message
> > 
> >  arch/arm/dts/Makefile                         |   1 +
> >  arch/arm/dts/stm32mp157-pinctrl.dtsi          |  63 +++
> >  .../arm/dts/stm32mp157a-avenger96-u-boot.dtsi | 177 +++++++++
> >  arch/arm/dts/stm32mp157a-avenger96.dts        | 362 ++++++++++++++++++
> >  arch/arm/mach-stm32mp/cpu.c                   |   2 +-
> >  board/st/stm32mp1/README                      |  23 ++
> >  6 files changed, 627 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
> >  create mode 100644 arch/arm/dts/stm32mp157a-avenger96.dts
> > 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
