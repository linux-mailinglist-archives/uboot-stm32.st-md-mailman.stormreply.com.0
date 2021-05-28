Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FDB394337
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 May 2021 15:07:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FCE0C57189;
	Fri, 28 May 2021 13:07:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D254C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 13:07:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SCwFbF025848
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 28 May 2021 15:07:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=IYWQfCcVquzzCrYAVLVDSV+H0O1dSxNkl1/lJzkKMu4=;
 b=YyNMFpM+BMOIZxbBfZ+g44j25scO1P6KH3g6GRf97pBy4C1pO9z9Wn6EI3bX0VARwKoT
 5m/NkzOMnNtZXrPjqo76KsObvo0Ht3qTQdzhuCAOCAnmyhDLhpkb+zLGTqNDRZ3dzwSO
 roN7jFd/34C+g5b3fnMA7lx8oEEBQbqU7XsYkT/tbgnp6CLestlflKzCNA21wsNyUfEs
 ejtLUqkBpFmbH6YUDNarOKb0yj92nLL56dVnicVj1nY1XyI4sAVj1H8P5I3fhaK8WHTg
 zXBzX2vJTcGvdLU5SzwdeyqGDTdLMmyCMRjiQu+6/X8cpwGuwxRjpS5VbvS2ZS1GlK4u cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38u03c0a9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 28 May 2021 15:07:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E43E10002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 15:07:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83A55229A74
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 15:07:28 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 15:07:28 +0200
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <YH3EKEuGy1topHtJ@nx64de-df6d00>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <f334c98f-1dd0-a3d8-8ccc-1e412a1ab752@foss.st.com>
Date: Fri, 28 May 2021 15:07:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YH3EKEuGy1topHtJ@nx64de-df6d00>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
Subject: Re: [Uboot-stm32] [PATCH] arm: dts: stm32mp157c-odyssey-som: enable
 the RNG1
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGksCgpPbiA0LzE5LzIxIDc6NTUgUE0sIEdyemVnb3J6IFN6eW1hc3playB3cm90ZToKPiBFbmFi
bGUgdGhlIHRydWUgcmFuZG9tIG51bWJlciBnZW5lcmF0b3IuIEl0IGNhbiBiZSB1c2VkLCBmb3Ig
ZXhhbXBsZSwgdG8KPiBnZW5lcmF0ZSBwYXJ0aXRpb24gVVVJRHMgd2hlbiBwYXJ0aXRpb25pbmcg
d2l0aCB0aGUgZ3B0IGNvbW1hbmQuIFRoZQo+IGdlbmVyYXRvciBpcyBhbHJlYWR5IGVuYWJsZWQg
aW4gdGhlIGRldmljZSB0cmVlcyBvZiBzZXZlcmFsIG90aGVyCj4gU1RNMzJNUDHigJBiYXNlZCBi
b2FyZHMsIGxpa2UgREt4IG9yIERIQ09NLgo+Cj4gU2lnbmVkLW9mZi1ieTogR3J6ZWdvcnogU3p5
bWFzemVrIDxnc3p5bWFzemVrQHNob3J0LnBsPgo+IENjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5k
ZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAtLS0KPiAgIGFyY2gvYXJtL2R0cy9zdG0zMm1wMTU3Yy1v
ZHlzc2V5LXNvbS5kdHNpIHwgNCArKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCj4KCkFwcGxpZWQgdG8gdS1ib290LXN0bS9tYXN0ZXIsIHRoYW5rcyEKClJlZ2FyZHMKUGF0
cmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJv
b3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vdWJvb3Qtc3RtMzIK
