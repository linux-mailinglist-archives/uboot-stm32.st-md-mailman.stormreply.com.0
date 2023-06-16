Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2D0733102
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 14:19:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D484C65E58;
	Fri, 16 Jun 2023 12:19:00 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD853C64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 12:18:58 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B724E86261;
 Fri, 16 Jun 2023 14:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686917938;
 bh=W7nqBZHnmgI9SrH0tqSJBlUsjx/njWd602j/rdtSV4o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KMBkI9dkaJ5g468VJmlEhwyGy+fVJzaSGHSetoIL2yXsqe6TpREZ5YqU+5gpX2c/Z
 45uzuHe+NULVPCjQgaOJ/ZbkgoxhtGkvKYbQHhabKwxpztMSOqi+DJkrwmmelCmlxc
 8jBQyCu47gP90bujZ41664zK9TUV3WY2zsOyxFGhFjuyVw8LJ1oFVEQ+JmR0xLHUDY
 th47kDrk4wC44X668pfJjgY0BkyDcG8AccX91a/4tnBseyG/7JJX6dl77qPBt1peut
 0VhmJ31ozAQCCLFSh0uncZVQxMcRoPmag9kyj6rbBeglHVzsyEzG8HkQKNJLR7X9c9
 XX8SN8RhMsDZw==
Message-ID: <2d510067-6725-0c84-b672-a0a701ac0fcf@denx.de>
Date: Fri, 16 Jun 2023 14:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20230504195208.4941-1-marex@denx.de>
 <6fa1fdfc-d983-dcb9-7a4c-60055505bc79@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6fa1fdfc-d983-dcb9-7a4c-60055505bc79@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Use __section(".data") with
 dot in the section name on DHSOM
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 6/16/23 13:46, Patrice CHOTARD wrote:
> 
> 
> On 5/4/23 21:52, Marek Vasut wrote:
>> The correct specifier of the section is ".data" and not "data",
>> use the former to place the variables in ".data" section.
>>
>> Fixes: 731fd50e27f ("ARM: stm32: Implement board coding on AV96")
>> Fixes: 92ca0f7446c ("ARM: dts: stm32: Synchronize DDR setttings on DH SoMs")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: u-boot@dh-electronics.com
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>   board/dhelectronics/dh_stm32mp1/board.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
>> index a9a2965a386..a0cdf83ea71 100644
>> --- a/board/dhelectronics/dh_stm32mp1/board.c
>> +++ b/board/dhelectronics/dh_stm32mp1/board.c
>> @@ -185,9 +185,9 @@ int checkboard(void)
>>   }
>>   
>>   #ifdef CONFIG_BOARD_EARLY_INIT_F
>> -static u8 brdcode __section("data");
>> -static u8 ddr3code __section("data");
>> -static u8 somcode __section("data");
>> +static u8 brdcode __section(".data");
>> +static u8 ddr3code __section(".data");
>> +static u8 somcode __section(".data");
>>   static u32 opp_voltage_mv __section(".data");
>>   
>>   static void board_get_coding_straps(void)
> 
> Applied to u-boot-stm/next

Since this is a bugfix, should be for current.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
