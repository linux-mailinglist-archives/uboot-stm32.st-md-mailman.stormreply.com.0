Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721F10A378
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 18:42:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFE50C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Nov 2019 17:41:59 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7BC6C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2019 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1574790106;
 bh=4tMF1X5yxXMRjW0P5iicTL5Q6TDsV9g6bgtH367npIQ=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=kjq+J495LVAdX92VuRXHx7Rk9Zv0adw2YnUCl8yl4Bi0g9n1WIkfCsiRf2F2/ww/R
 jitTqEkBrBVBIcS/4j7vhL7UdgnqbXcMSYT2UU+5FX1F1pE1+2kKBL5ZGsihq3OpQA
 MF57FG6YRO/f2hEAylGX7cxLkqEMkuxUDes95JOo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([94.114.42.168]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8hVB-1iV00W3yc5-004lY8; Tue, 26
 Nov 2019 18:41:46 +0100
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20191125134811.16462-1-patrice.chotard@st.com>
 <a4bdcd488930473dbeb01c6e9d678398@SFHDAG6NODE3.st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <217ce077-0e80-5f94-cb7b-511f8c527b1f@gmx.de>
Date: Tue, 26 Nov 2019 18:41:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a4bdcd488930473dbeb01c6e9d678398@SFHDAG6NODE3.st.com>
Content-Language: en-US
X-Provags-ID: V03:K1:Ywzl5nsaEJKXoJm0AkkNnQxF/u6ttPkLXCHB2IGTENlashQFyia
 Wj1VSwvfoEAVGLf6rpplMEUcj4wdDFW9fu/CzgwPfnVmACT5R4t9A0Kv6/6dhA51my3237k
 eXniCm8ZFxxxrGC/cN2MD/yMZk+TfRz085GHLMXPENNAkMGc5/1cTx5fmX0Nd/iwHGjcFN2
 S+Itzh45BMHP2lIKD8zHA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Md5TXqAhtWo=:tZ5hrTfZgjII6ysEr9P9Mu
 jHAhpstY5QqAetkPl6/5aG5eTja7KpXoZ7YlkZFKYKmGE8ROKZ+KSKvMTfcjfxexPnuovX1gf
 0qof9UrF4hhXf7qZiVJRnJuTWBKysZ5MD50DAMYxQuNq8nAwujIdyZDNOjQlOI2V43wkELJnz
 QQhD4JYqY58yP7nRRVxyz9oNL+iD5lRMDI1Hrp5b0OWwtm8WJYvkm7yxT802REuzJY+vqxTBX
 6NohIAvgPJueezthg7nN+qmSX16HyC/1da/uWb2TWtHo59uB3HrVgD39JukqULnzbqsK3wPG9
 LMdTD7qqX5qWrV+HdfJ2k9gSx3dRYQGguRaGIllO34CnxbFSy0veuZq+IIc7URnccdXLXP3ar
 ZORPkQXd61e9C9hnq7J2XyVZjc+DolYRfWGxKj6mSzQP8F1CSfnP1i5a/2p2XPnvZN8hgTZzN
 GDuGPMFvWAZ4sDIVh5PPEfOwTTKtpHcgJI9syK5it02bygCaLYg4szEkQBmhgHBTYZ9uZQY21
 QY1XYXqp60dmzvBoE74dyREdZfRVM+IsaManjIDiZKs0JrOOtharJeLiBRmV+1H8MyP/FA23H
 NZlvNmnlQ/psvq9uMdQG8fzh2x/TGZn4qYWQjXJwTVW0hgYygG3WujC6g8TooO2qonrTiyzaH
 hzSHE6AltbcYyZhV3Ayyv+lVM44/35x5YSX5gBVXFLkTnihriotKsBemPsNM9i3CLmAwPKqYW
 EHVW4RgsKYjlKLLykl+1pUMVw7zLDjP5uiFZAXtKDQYwv+NXU+MX481URGCXQgiqnK9cpLREf
 upnNoDFDzDMNMxfA6C/UY4NwnmMOoKEuIQJDCYy8TLz+M6A71zC0fX4RZf4DqtH5udH8pQbu/
 JGrsuYTRLv55QudrdtrY7fIewSdL93SZYU+ADOn3GaCMkefKys1Pt2hgQhHzUla/C/YDrm/zn
 dCOrRwANtwb3C3nLZ2qx88vdawh3RJIIHQ0YrsJ6Dp2qN+2xxT1PNpPYLiHT+Ha9qmYlQJ3Aw
 QJP34GWMObbxoy9CgsZO1kxtXXrv8/kWShwIVdRHrYMQS5yGyvvi45f5cJ8g10RcjqjUr58vq
 lRllpM7xTiD++2kKlF41gwo2Ea3v96qtpkZS1I0f+YCKzImvHe4S2f8WxsnP7xMDr/DQeZdEQ
 T/mfHeeTVvmM/dWDWRUZsDFZvRoP4zIJ0XeDVgahWwl9DQTzg+TLfeX6DR4JQFffzC8m1ziXS
 Q+Nfw0THY5cE3n51nrqF1MHtAs1UZhCyNK9qYqwrHrQIDm4MmYlQ5cuD1qCM=
Cc: Stephen Warren <swarren@nvidia.com>, Simon Glass <sjg@chromium.org>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Trevor Woerner <trevor@toganlabs.com>, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas MANOCHA <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH] board_f.c: Insure gd->new_bootstage
	alignment
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

On 11/26/19 1:16 PM, Patrick DELAUNAY wrote:
> Hi,
>
>> From: Patrice CHOTARD <patrice.chotard@st.com>
>> Sent: lundi 25 novembre 2019 14:48
>>
>> In reserve_bootstage(), in case size is odd, gd->new_bootstage is not aligned. In
>> bootstage_relocate(), the platform hangs when getting access to data-
>>> record[i].name.
>> To avoid this issue, make gd->new_bootstage 16 byte aligned.
>>
>> Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>> Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
>> ---
>
> This patch is mandatory for stm32mp1 (ARM plaform with bootstage feature activated).
>
> Without this patch, the boot failed for v2020.01-rc3 (crash has struct pointer new_bootstage is not aligned).
>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
> Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
>
>>   common/board_f.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/common/board_f.c b/common/board_f.c index e3591cbaeb..9cd4cfaf5f
>> 100644
>> --- a/common/board_f.c
>> +++ b/common/board_f.c
>> @@ -559,6 +559,7 @@ static int reserve_bootstage(void)
>>   	int size = bootstage_get_size();
>>
>>   	gd->start_addr_sp -= size;
>> +	gd->start_addr_sp = ALIGN_DOWN(gd->start_addr_sp, 16);

A comment in the code describing why this ALIGN_DOWN() is done would be
helpful.

Is this value sufficient for all boards?

I found references for:

x86_64 ABI: https://reviews.llvm.org/D30049: 16 bytes
ARMv8: ARMv8 Instruction Set Overview: quad word, 16 bytes

Best regards

Heinrich

>>   	gd->new_bootstage = map_sysmem(gd->start_addr_sp, size);
>>   	debug("Reserving %#x Bytes for bootstage at: %08lx\n", size,
>>   	      gd->start_addr_sp);
>> --
>> 2.17.1
>
> Thanks
>
> Patrick
>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
