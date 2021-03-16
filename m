Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2478633D4B9
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Mar 2021 14:19:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDA68C57B77;
	Tue, 16 Mar 2021 13:19:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1CDBC57B5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 13:19:32 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GDHC3C016984; Tue, 16 Mar 2021 14:19:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=otlSN415xabC2sTajebLFyqJVmbnJHfJWrNHiE6oXvw=;
 b=azXyxfDZg2qI5ZaUlVlDQCJIYHUE4i6u3C/K49f7Td2gJA7GYWxvNd/YUvMIGmxN9ayp
 0EAbmXISbW6H/7yX367HFspSwKbgstWK5wCSZXP1z1GSG40tzAE4ts7PYxnDRw5h2kUv
 D+uqHT4kgfhU+Z6UxYsoc3yFZCz3xkzjPqeOiEkmYoxlSWpbPsvd8UBfYa4sdx9D1suN
 jh1cY/JM52fa8DiT0LSwr0eFa0tCOu9LzvQmw+C4eDtUJ4uLfTna+H+MZxrEC9sjjG+u
 tpEimkfg27hnBo5oHWvQsmpcya+x1RR6H4sfXZ4L6PPFQQqLV4L9awE1jQscV61OrInF gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 378ps9gn0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 14:19:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C2EF210002A;
 Tue, 16 Mar 2021 14:19:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9967D2318B1;
 Tue, 16 Mar 2021 14:19:27 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Mar
 2021 14:19:26 +0100
To: Jagan Teki <jagan@amarulasolutions.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Matteo Lisi <matteo.lisi@engicam.com>
References: <20210315173256.103731-1-jagan@amarulasolutions.com>
 <20210315173256.103731-3-jagan@amarulasolutions.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <556d9738-d29e-8d5a-61ae-360014461229@foss.st.com>
Date: Tue, 16 Mar 2021 14:19:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315173256.103731-3-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_04:2021-03-16,
 2021-03-16 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH v2 2/9] ARM: dts: stm32: Add Engicam
 i.Core STM32MP1 1X4Gb DDR3
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

SGkgSmFnYW4KCk9uIDMvMTUvMjEgNjozMiBQTSwgSmFnYW4gVGVraSB3cm90ZToKPiBFbmdpY2Ft
IGkuQ29yZSBTVE0zMk1QMSBTT0RJTU0gU29NIGhhcyBtb3VudGVkIDF4NEdiIEREUjMKPiB3aGlj
aCBoYXMgMzJiaXRzIHdpZHRoIDUyODAwMEtoeiBmcmVxdWVuY3kuCj4KPiBBZGQgRERSIGNvbmZp
Z3VyYXRpb24gdmlhIGR0c2kuCj4KPiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRy
aWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFn
YW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBmb3IgdjI6Cj4gLSBjb2xs
ZWN0IFBhdHJpY2Ugci1iCj4KPiAgIC4uLi9zdG0zMm1wMTUtZGRyMy1pY29yZS0xeDRHYi0xMDY2
LWJpbkcuZHRzaSB8IDExOSArKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
MTkgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2R0cy9zdG0z
Mm1wMTUtZGRyMy1pY29yZS0xeDRHYi0xMDY2LWJpbkcuZHRzaQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2R0cy9zdG0zMm1wMTUtZGRyMy1pY29yZS0xeDRHYi0xMDY2LWJpbkcuZHRzaSBiL2Fy
Y2gvYXJtL2R0cy9zdG0zMm1wMTUtZGRyMy1pY29yZS0xeDRHYi0xMDY2LWJpbkcuZHRzaQo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMWE0NWM2ZmM2Mwo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDE1LWRkcjMtaWNvcmUtMXg0R2It
MTA2Ni1iaW5HLmR0c2kKPiBAQCAtMCwwICsxLDExOSBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCsgT1IgQlNELTMtQ2xhdXNlCj4gKy8qCj4gKyAqIENvcHlyaWdodCAo
QykgMjAxNS0yMDE4LCBTVE1pY3JvZWxlY3Ryb25pY3MgLSBBbGwgUmlnaHRzIFJlc2VydmVkCj4g
KyAqLwo+ICsKPiArLyoKPiArICogRmlsZSBnZW5lcmF0ZWQgYnkgU1RNaWNyb2VsZWN0cm9uaWNz
IFNUTTMyQ3ViZU1YIEREUiBUb29sIGZvciBNUFVzCj4gKyAqIEREUiB0eXBlOiBERFIzIC8gRERS
M0wKPiArICogRERSIHdpZHRoOiAzMmJpdHMKPiArICogRERSIGRlbnNpdHk6IDRHYgo+ICsgKiBT
eXN0ZW0gZnJlcXVlbmN5OiA1MjgwMDBLaHoKPiArICogUmVsYXhlZCBUaW1pbmcgTW9kZTogZmFs
c2UKPiArICogQWRkcmVzcyBtYXBwaW5nIHR5cGU6IFJCQwo+ICsgKgo+ICsgKiBTYXZlIERhdGU6
IDIwMTkuMDUuMTQsIHNhdmUgVGltZTogMTE6MjU6MTYKPiArICovCj4gKyNkZWZpbmUgRERSX01F
TV9DT01QQVRJQkxFIGRkcjMtaWNvcmUtMTA2Ni04ODgtYmluLWctMXg0Z2ItNTI4bWh6Cj4gKyNk
ZWZpbmUgRERSX01FTV9OQU1FCSJERFIzLUREUjNMIDMyYml0cyA1MjgwMDBLaHoiCgoKY29zbWV0
aWM6IHlvdSBjYW4gcmVwbGFjZSBLaHogYnkga0h6CgogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIChzZWUgY29tbWl0ICJBUk06IGR0czogc3RtMzI6IEZpeCBjb3NtZXRpYyB0eXBvOiB1
c2UgCidrSHonIGFzIGtpbG9oZXJ0eiIpCgpUaGlzIG1vZGlmaWNhdGlvbiBpcyBhbHNvIHJlcXVl
c3RlZCBpbiBDdWJlTVggZm9yIGdlbmVyYXRpb24gZmlsZS4KCgpSZXZpZXdlZC1ieTogUGF0cmlj
ayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KClRoYW5rcwpQYXRyaWNr
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
