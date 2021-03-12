Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADB3338C77
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:14:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EB98C57196;
	Fri, 12 Mar 2021 12:14:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E80EBC57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:14:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CC7QHG024093; Fri, 12 Mar 2021 13:14:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SI1ETovyb4qtW/m4Eo5yDKWk2KkE9kGtLQVtEIqbEXg=;
 b=pIJ99w5l/fw4kJRUheJ+NcdsGwU3vR/KVKWmS0Xbxi02RKi+pBojwEsl6Slj4T9nUfjn
 ARVnDpD7uW6I/Axe4ReJWKKJGVceeasfL1chnWfs0PQu73xk249uU6u2rzQS9mCLmlvD
 queluUeOaqei8yzPnbgJxFGTMopM0pUk5zkxF1owWaiOT9SAfesGF8iW33DtAT0HRv5Q
 2gQuithmvkzdqhJ6VjTBDR2E/RooCgXwMG8/c4x2XPpwnGCoHA5FW+L0vuOMx8aMM6gu
 zOFKzMFZsDF2oWqPU0ITum9IgeSN+2LGfauLWAdfgPTUY9aOyEmaD803z/XKfaiKMCcJ Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 374037cxu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:14:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6DABF10002A;
 Fri, 12 Mar 2021 13:14:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 61F30228DA1;
 Fri, 12 Mar 2021 13:14:29 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:14:28 +0100
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210224123821.22848-1-patrice.chotard@foss.st.com>
 <20210224123821.22848-2-patrice.chotard@foss.st.com>
 <9a141930-5eb0-873b-6800-de6c9f40a8ae@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <4c2fb0ed-ae5f-bee6-3793-e29f0179cda5@foss.st.com>
Date: Fri, 12 Mar 2021 13:14:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9a141930-5eb0-873b-6800-de6c9f40a8ae@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>, Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: st: Remove board_early_init_f
 and board_late_init callbacks for stm32 boards
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkKCk9uIDMvMTIvMjEgMTA6NTEgQU0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gSGkgUGF0
cmljZQo+IAo+IE9uIDIvMjQvMjEgMTozOCBQTSwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBS
ZW1vdmUgYm9hcmRfZWFybHlfaW5pdF9mKCkgYW5kIGJvYXJkX2xhdGVfaW5pdCgpIGNhbGxiYWNr
cyBmb3Igc3RtMzIKPj4gYm9hcmRzIGFzIHRoZSBjb3JyZXNwb25kaW5nIGZsYWdzIChDT05GSUdf
Qk9BUkRfTEFURV9JTklUIGFuZAo+PiBDT05GSUdfQk9BUkRfRUFSTFlfSU5JVF9SKSBhcmUgbm93
IGRpc2FibGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2Uu
Y2hvdGFyZEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+Cj4+IMKgIGJvYXJkL3N0L3N0bTMyZjQyOS1k
aXNjb3Zlcnkvc3RtMzJmNDI5LWRpc2NvdmVyeS5jwqDCoCB8wqAgNSAtLS0tLQo+PiDCoCBib2Fy
ZC9zdC9zdG0zMmY0MjktZXZhbHVhdGlvbi9zdG0zMmY0MjktZXZhbHVhdGlvbi5jIHzCoCA1IC0t
LS0tCj4+IMKgIGJvYXJkL3N0L3N0bTMyZjQ2OS1kaXNjb3Zlcnkvc3RtMzJmNDY5LWRpc2NvdmVy
eS5jwqDCoCB8wqAgNSAtLS0tLQo+PiDCoCBib2FyZC9zdC9zdG0zMmY3NDYtZGlzY28vc3RtMzJm
NzQ2LWRpc2NvLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNSAtLS0tLQo+PiDCoCBib2FyZC9z
dC9zdG0zMmg3NDMtZGlzY28vc3RtMzJoNzQzLWRpc2NvLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDEwIC0tLS0tLS0tLS0KPj4gwqAgYm9hcmQvc3Qvc3RtMzJoNzQzLWV2YWwvc3RtMzJoNzQzLWV2
YWwuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEwIC0tLS0tLS0tLS0KPj4gwqAgNiBmaWxl
cyBjaGFuZ2VkLCA0MCBkZWxldGlvbnMoLSkKPj4KPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBE
ZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRy
aWNrCj4gCgpBcHBsaWVkIHRvIHUtYm9vdC1zdG0vbmV4dAoKVGhhbmtzCgpQYXRyaWNlCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1h
aWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0
bTMyCg==
