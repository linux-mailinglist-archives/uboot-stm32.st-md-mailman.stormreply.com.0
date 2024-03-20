Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2803B88120D
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Mar 2024 14:06:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3CB2C6DD60;
	Wed, 20 Mar 2024 13:06:04 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3BE6C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Mar 2024 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1710939960; x=1711544760; i=xypron.glpk@gmx.de;
 bh=B8mZfqkX1hF7Z/GcUQCfZ8oOcGH6nEQGxZbUmcKufVI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=cVSTIPoK0F2wgTx1U76WX+TXiuHgHsAxR7TashQ9WueDNyerWMKenQbMaIour1Wm
 cQXnJm/x7bqhfmLZIPx4sEN33G8HVcFnGXiSQHgCVKvID5CncC4835hVhw13Hrs3P
 Tf+qQWGL+hNu2roA9fFNZkBwTqOQ8dr3mSTmgJi84jATFmRMSi1ZhTu16IqaYY8s/
 HwdaM/jm4Ymw4jPZVDAbrDAWMPkgz63VzGniqDj51DRcpHnIWFa7Z0i/K+G0IRrf1
 eyihk4ODqgggLrT/gGuj37BFAEBJvqt1W3nILVfbqQpu+LkrcP8TNoMjJPEvtnYCF
 +/rmVEzA9wyrhgnMaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.126] ([62.143.245.32]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MulqD-1qveGS3TUZ-00rltH; Wed, 20
 Mar 2024 14:05:59 +0100
Message-ID: <84a8915f-ec97-4a1a-9acb-edae56ae5c97@gmx.de>
Date: Wed, 20 Mar 2024 14:05:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>
References: <20240320113051.1.If084ef69b9da34900391d0f0acc13475b250ce9f@changeid>
 <CAC_iWj+1j+WR0aCTLA9Z21j347FpT95t3iWZnJoPFhH5E9jScQ@mail.gmail.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <CAC_iWj+1j+WR0aCTLA9Z21j347FpT95t3iWZnJoPFhH5E9jScQ@mail.gmail.com>
X-Provags-ID: V03:K1:14sbWp/bE87MiEGfvwZ0pSYEWmZ3W5jTeFYAM/dAygdkK7or80Q
 cyOOXlK9QTTP/wHVps/RgUn5cKXI7hpmzKVbhcNualeRk8eWi+Ceei5o7/oN64g2ep5K4Hp
 4y9TPWRdJWAPherwUmlTvB+XczCvFhr10PW5c7fBGj/BIQD12uC7UfbEIxqltqJ7Q5QI0nX
 x2T3nO0EKR13oV98T9sfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GyuGqn7qc2A=;ksGssXRchmSTmV/4+oydjHnIDCH
 l7bcSeR8jdfciPPJpAu4AuGVhuoqivlS7orBQHabyuQ3dM1ayxrnUMfeuIoPUOVtBv7Lx9nTd
 zBfZqITu1x/E/+fUX7VRVnB68Ybg5a9pj5F3gU8kACHbEaDV8feKD0XKoA0+BajytOGoPlNqW
 JOmN7L76hkp7NZ4lDw95z/W2kQss7ZuLdHmb+348aUBlax/0475YMmtJJSvK7o0Rlr6487OID
 gN/C+8Rov6MpIMcRVBznwe72c99wJgLYTQLgPCfoHJjE9F7lk4RUzVx7cwtjy+2yfCPwbHYu0
 LjU+X8G5Jv0B2xe+o7168L5i4at+gzEaU3MwpQHfvKGk1CbI2D7irGwu/P4etkYcakeQb8SH7
 vlWcByb0Vz2pTs6iWAj56xnTa7PcDJoJ26Y5X8aHxCBQwOsBT07U4fwmSUA/jsRVRpUf19zQM
 aI2kVSKZmwSF38Qaf3sv+ItweBc2jTSmQis85Ru1Sj5SNeO2PROWMUtrfvdAyanAGS4+9fhmK
 0UMb/UsUOl42Ggbnt1IJW+mEmISrOq7hdZFJ54y+kYZX0v3FINlm7qL7IbGGKSDJk0apkDddo
 f+U9SEhjv9dcTT+cxRSix6eGml4jLReiEcbFgc8A9d69D4Faou8JE+OCSItwFPVUWa1xHqSoU
 tQfk2w9AJIow951ksHPTiPWfCggvkbN8c9hnWIepdIIHpXdvFzBqG5ns5zmAHowWZqVrMXYSN
 qi+AdCCaVgG1D/uW1YHroYEDERtUMUGdI5fKBHGuQxV1gsmDY0W+nl2MizMFkwNila/TOlWlx
 rBXN17fqfFSCxdNQ4ilMu46Rm6ZAYaUVPETZOsFVIqfUc=
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] efi_loader: Add absolute path to
	EFI_VAR_FILE_NAME
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

On 20.03.24 12:53, Ilias Apalodimas wrote:
> Hi Patrice,
>
> On Wed, 20 Mar 2024 at 12:31, Patrice Chotard
> <patrice.chotard@foss.st.com> wrote:
>>
>> If the ESP partition is formatted in ext4, we got the following error :
>>
>> STM32MP>  setenv -e -nv -bs -rt -v OsIndications =0x0000000000000004
>> GUID: 8be4df61-93ca-11d2-aa0d-00e098032b8c (EFI_GLOBAL_VARIABLE_GUID)
>> Attributes: 0x7
>> Value:
>>      00000000: 04 00 00 00 00 00 00 00                          ........
>> File System is consistent
>> Please supply Absolute path
>
> This error message comes from ext4_common.c and it's ext4 specific. Do
> you have any idea why this exists?
> What happens to other filesystems? IOW does this change the behavior
> of the existing code if it tries to write a file in FAT?

When reading a file with the ext4 driver leading '/' are ignored by
removing them in ext4fs_find_file1(). It is really inconsistent that
when writing a leading '/' is required.

We can simply remove the check in ext4fs_get_parent_inode_num(). I found
no issues when saving to an ext4 file system with the check removed.

I will send a patch.

Best regards

Heinrich

>
> Thanks
> /Ilias
>
>> ** Error ext4fs_write() **
>> ** Unable to write file ubootefi.var **
>> Failed to persist EFI variables
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>
>>   include/efi_variable.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/efi_variable.h b/include/efi_variable.h
>> index 805e6c5f1e0..8d507460b20 100644
>> --- a/include/efi_variable.h
>> +++ b/include/efi_variable.h
>> @@ -92,7 +92,7 @@ efi_status_t efi_query_variable_info_int(u32 attributes,
>>                                           u64 *remaining_variable_storage_size,
>>                                           u64 *maximum_variable_size);
>>
>> -#define EFI_VAR_FILE_NAME "ubootefi.var"
>> +#define EFI_VAR_FILE_NAME "/ubootefi.var"
>>
>>   #define EFI_VAR_BUF_SIZE CONFIG_EFI_VAR_BUF_SIZE
>>
>> --
>> 2.25.1
>>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
