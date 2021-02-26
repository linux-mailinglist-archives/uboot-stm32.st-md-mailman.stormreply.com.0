Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCC1325E7A
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Feb 2021 08:54:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7ABD4C57B59;
	Fri, 26 Feb 2021 07:54:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0445C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 07:54:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11Q7qdHt024804; Fri, 26 Feb 2021 08:54:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=zmGeAt4GGw9Bqmc/c9rpq0GjaM9hHAFjKfqROnt0FbA=;
 b=XKOzx1kbMXHZb7FM/JzDHgriGgcMwZUZcWjeKL7Qdr1xGYSz11YeKtk0iEweRRiBVjxE
 nBIwTDq9tOC4vdtKKJCRxBpxRRvxUGfAZ16P+EndqsocJt17+DmiGT16rZxUHbzUA6Bi
 Fhrk/c6wE61uWRfupeQuFps2ilqC+JAsHW6TdapCmnH2wQqh8Xbl0cnGPZ5gi7eJgQnn
 wWjUy6Qv+69OEDvWZt/pD/+qlb52UIZGTcbH1vOWzhETK++cmLG2+wjQMG3EE82QumRq
 Vhh2Ya90gGJNpKmPhsIq7SZSR7qteH+q7mkCgX3B6t6Cfg54Nam6COz/Lmup+57ouAsR pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66vug2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 08:54:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 21E3A100038;
 Fri, 26 Feb 2021 08:54:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6ED2A21E690;
 Fri, 26 Feb 2021 08:54:30 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Feb
 2021 08:54:29 +0100
To: Mark Kettenis <mark.kettenis@xs4all.nl>
References: <20210224124756.12491-1-patrice.chotard@foss.st.com>
 <c1bc614c7c3e9458@bloch.sibelius.xs4all.nl>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <8826f199-cbed-6ee7-e495-c9c0a1a79595@foss.st.com>
Date: Fri, 26 Feb 2021 08:54:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c1bc614c7c3e9458@bloch.sibelius.xs4all.nl>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_02:2021-02-24,
 2021-02-26 signatures=0
Cc: sjg@chromium.org, patrice.chotard@st.com, seanga2@gmail.com,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com, etienne.carriere@linaro.org
Subject: Re: [Uboot-stm32] [PATCH] firmware: scmi: Replace
 memcpy_from/toio() by memcpy() in scmi_read/write_resp_from_smt()
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

Hi Mark

On 2/24/21 3:05 PM, Mark Kettenis wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>> Date: Wed, 24 Feb 2021 13:47:55 +0100
>>
>> To avoid "synchronous abort" in AARCH64 in case the "from" address
>> is not aligned, replace memcpy_toio() and memcpy_fromio() by memcpy().
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>
>>  drivers/firmware/scmi/smt.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> This doesnt really make sense.  There is no guarantee that memcpy()
> doesn't do an unaligned load or store either.
> 
> Unaligned loads and stores from/to normal memory should just work on
> arm64, and memcpy_toio() and memcpy_fromio() make sure they don't do
> unaligned loads and stores from/to "IO" memory (in this case the
> shared memory buffer).

You are right. After further analysis, i understood why the "synchronous abort" occurs.
At early stage, before U-Boot relocation, MMU is disabled and then all the "normal" memory 
space is not yet configured with MT_NORMAL type.
In this situation, all 64bits accesses to a none 64 bits aligned pointer in "normal memory"
triggers a synchronous abort.

Same accesses, with MMU configured (after U-Boot relocation), are OK.

I will propose a new patch which will update memcpy_from/toio() and forbid 64bits accesses to 
non aligned 64bits pointer in case MMU is not yet enabled.

Thanks

Patrice
> 
>> diff --git a/drivers/firmware/scmi/smt.c b/drivers/firmware/scmi/smt.c
>> index d25478796a..b001163b62 100644
>> --- a/drivers/firmware/scmi/smt.c
>> +++ b/drivers/firmware/scmi/smt.c
>> @@ -93,7 +93,7 @@ int scmi_write_msg_to_smt(struct udevice *dev, struct scmi_smt *smt,
>>  			  SMT_HEADER_PROTOCOL_ID(msg->protocol_id) |
>>  			  SMT_HEADER_MESSAGE_ID(msg->message_id);
>>  
>> -	memcpy_toio(hdr->msg_payload, msg->in_msg, msg->in_msg_sz);
>> +	memcpy(hdr->msg_payload, msg->in_msg, msg->in_msg_sz);
>>  
>>  	return 0;
>>  }
>> @@ -124,7 +124,7 @@ int scmi_read_resp_from_smt(struct udevice *dev, struct scmi_smt *smt,
>>  
>>  	/* Get the data */
>>  	msg->out_msg_sz = hdr->length - sizeof(hdr->msg_header);
>> -	memcpy_fromio(msg->out_msg, hdr->msg_payload, msg->out_msg_sz);
>> +	memcpy(msg->out_msg, hdr->msg_payload, msg->out_msg_sz);
>>  
>>  	return 0;
>>  }
>> -- 
>> 2.17.1
>>
>>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
