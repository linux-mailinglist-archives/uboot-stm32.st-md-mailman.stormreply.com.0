Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7631B4BCA
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 19:29:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5A43C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 17:29:23 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A85AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 17:29:21 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03MHTHmG029024;
 Wed, 22 Apr 2020 12:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587576557;
 bh=080CjEDd9Re8/3YJQcMfq/qHfbpMoUOSq9v323yA4rk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Oq+pmjF9bmB8UF/QNVHd/yBPpCpKfVaYEtUSOvN9jPHiDzuPnwvKkyhd0qT5EFIPY
 Kjis34vARaPGcFBBToW1x1ybMNzRlKH8bBgCFlk172A7+mh4y394/1ya9bIoP8h2RX
 N2gcRt9qa5uFc0GNfY+5djo6jz6FJBlEGpo+G4Iw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03MHTHOk050349
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 22 Apr 2020 12:29:17 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Apr 2020 12:29:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 22 Apr 2020 12:29:16 -0500
Received: from [10.24.69.20] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03MHTBc9039740;
 Wed, 22 Apr 2020 12:29:15 -0500
To: Tom Rini <trini@konsulko.com>, Patrick Delaunay <patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-2-patrick.delaunay@st.com>
 <20200417210548.GH4555@bill-the-cat> <20200422162743.GA4555@bill-the-cat>
From: Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <a74c5e63-e2ce-fdb4-6e77-d5499333d8be@ti.com>
Date: Wed, 22 Apr 2020 22:59:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20200422162743.GA4555@bill-the-cat>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 22/04/20 9:57 PM, Tom Rini wrote:
> On Fri, Apr 17, 2020 at 05:05:48PM -0400, Tom Rini wrote:
>> On Mon, Jan 13, 2020 at 11:34:55AM +0100, Patrick Delaunay wrote:
>>
>>> Convert 'pinctrl-single' using livetree functions
>>> - dev_read_prop
>>> - dev_read_u32_default
>>> - dev_read_u32_array
>>> - dev_read_bool
>>> - dev_read_addr
>>> and get rid of DECLARE_GLOBAL_DATA_PTR.
>>>
>>> Reviewed-by: Simon Glass <sjg@chromium.org>
>>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>>
>> Applied to u-boot/master, thanks!
> 
> Now that I've setup my AM65x board, this commit is breaking boot there
> and I don't have any idea why.  I don't get any sort of output on either
> core (this platform takes am65x_evm_r5 for the SPL and am65x_evm_a53 for
> the main core).
> 

Ahh thanks for the pointer Tom. I have been struggling since yesterday as why my
board is not booting with latest master. Looks like this patch is passing the
wrong device pointer for searching pinctrl-single-pins. Just posted a patch
fixing it[0]. Please have a look and merge it asap.

[0]
https://patchwork.ozlabs.org/project/uboot/patch/20200422172531.29649-1-lokeshvutla@ti.com/

Thanks and regards,
Lokesh

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
