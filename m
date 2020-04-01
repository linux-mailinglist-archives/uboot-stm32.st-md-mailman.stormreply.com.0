Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AAD19ACFE
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 15:41:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37046C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Apr 2020 13:41:11 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95CF6C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 13:41:09 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48snQr6GL5z1rvxj;
 Wed,  1 Apr 2020 15:41:08 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48snQr5jdJz1r0cW;
 Wed,  1 Apr 2020 15:41:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 3dGv1YUHSf-l; Wed,  1 Apr 2020 15:41:07 +0200 (CEST)
X-Auth-Info: c+B8UPMnG3crJHEUgDhJZ/MSf6Uxa5t2YeDpVv8hl+s=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  1 Apr 2020 15:41:07 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>, Tom Rini
 <trini@konsulko.com>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <500b672581d74a37b23de7a9c35125c9@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <abf4feae-f411-d0b9-4f86-eb1bc47778f2@denx.de>
Date: Wed, 1 Apr 2020 15:41:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <500b672581d74a37b23de7a9c35125c9@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request: u-boot-stm/master
	=u-boot-stm32-20200401
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

On 4/1/20 2:43 PM, Patrick DELAUNAY wrote:
> Hi Tom,

Hi,

> Please pull the latest STM32 master bugfix for v2020.04 = u-boot-stm32-20200401
> 
> With the following changes:
> - Fix device tree of Avenger96 board from Arrow Electronics and add
>   compatibility with stm32mp15_dhcom_basic_defconfig
> 
> CI status: Failed for vexpress_ca9x4 test.py
>      https://gitlab.denx.de/u-boot/custodians/u-boot-stm/pipelines/2592
> 
> But local compilation is OK with buildman on stm32 targets.
> I think it is enough as the Marek's patches only update the dh board code and the AV96 device tree.

Works well on my AV96, thanks.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
